class MarkersController < ApplicationController
  def create
    @marker = Marker.new(marker_params)
    @marker.place = Place.find(params[:place_id])
    authorize @marker
    if @marker.save
      redirect_to list_path(@marker.list), notice: "#{@marker.place.name} has been added"
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
