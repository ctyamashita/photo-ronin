class PhotosController < ApplicationController
  def create
    @photo = Photo.new(photo_params)
    authorize @photo
    @photo.user = current_user
    @photo.place = Place.find(params[:place_id])
    @photo.save
    redirect_to place_path(@photo.place), notice: "Your photo has been added"
  end

  private

  def photo_params
    params.require(:photo).permit(:photo)
  end
end
