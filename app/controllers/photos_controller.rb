class PhotosController < ApplicationController
  def create
    @photo = Photo.new(photo_params)
    authorize @photo
    @photo.user = current_user
    @photo.place = Place.find(params[:place_id])
    @photo.save
    redirect_to place_path(@photo.place), notice: "Your photo has been added"
    @like = 0
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

  # def count_like
  #   like_num = @photo.like?.count.to_i
  #   User.
  # end

end
