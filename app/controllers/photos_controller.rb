require 'exifr/jpeg'
class PhotosController < ApplicationController
  def create
    @photo = Photo.new(photo_params)
    authorize @photo
    @photo.user = current_user
    @photo.place = Place.find(params[:place_id])
    @photo = add_metadata(@photo)
    if Place.near(@photo.geocode, 0.5).include?(@photo.place)
      @photo.save
      redirect_to place_path(@photo.place), notice: "Your photo has been added"
    else
      redirect_to place_path(@photo.place), alert: "Invalid file or geolocation"
    end
  end

  def like
    @photo = Photo.find(params[:id])
    if current_user.liked?(@photo)
      current_user.dislikes(@photo)
    else
      current_user.likes(@photo)
    end
  end




  private

  def photo_params
    params.require(:photo).permit(:photo)
  end

  def add_metadata(photo)
    if params[:photo][:photo].content_type == ("image/jpeg" || "image/jpg") && EXIFR::JPEG.new(params[:photo][:photo].tempfile.path).exif?
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
