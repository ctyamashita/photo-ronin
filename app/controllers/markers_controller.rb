class MarkersController < ApplicationController
  def create
    @marker = Marker.new(marker_params)
    @marker.place = Place.find(params[:place_id])
    authorize @marker
    if @marker.save
      redirect_to place_path(@marker.place), notice: "#{@marker.place.name} has been added to #{@marker.list.title}."
    else
      @place = Place.find(params[:place_id])
      render place_path(@place)
    end
  end

  private

  def marker_params
    params.require(:marker).permit(:list_id)
  end
end
