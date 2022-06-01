require 'exifr/jpeg'
class PhotosController < ApplicationController
  def create
    @photo = Photo.new(photo_params)
    authorize @photo
    @photo.user = current_user
    @photo.place = Place.find(params[:place_id])
    @photo = add_metadata(@photo)
    @photo.save
    redirect_to place_path(@photo.place), notice: "Your photo has been added"
  end

  private

  def photo_params
    params.require(:photo).permit(:photo)
  end

  def add_metadata(photo)
    if EXIFR::JPEG.new(params[:photo][:photo].tempfile.path).exif?
      photo.latitude = EXIFR::JPEG.new(params[:photo][:photo].tempfile.path).gps.latitude
      photo.longitude = EXIFR::JPEG.new(params[:photo][:photo].tempfile.path).gps.longitude
      photo.camera = EXIFR::JPEG.new(params[:photo][:photo].tempfile.path).model
      photo.exposure = EXIFR::JPEG.new(params[:photo][:photo].tempfile.path).exposure_time.to_s
      photo.aperture = EXIFR::JPEG.new(params[:photo][:photo].tempfile.path).f_number.to_f
      photo.taken_on = EXIFR::JPEG.new(params[:photo][:photo].tempfile.path).date_time
    end
    photo
  end
end
