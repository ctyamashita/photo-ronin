class ListsController < ApplicationController
  def index
    @lists = policy_scope(List)
  end

  def new
    # @list = List.new
    authorize @list
  end

  def create
    @place = Place.find(params[:place_id])
    @list = List.new(list_params)
    @list.user = current_user
    authorize @list

    unless @list.save
      @list = List.new(title: "New_List_#{List.all.any? ? List.last.id : 1}", user: current_user)
      @list.save
    end
    @marker = Marker.new(list: @list, place: @place)
    @marker.save

    redirect_to list_path(@list), notice: "#{@place.name} has been added to #{@list.title}"
  end

  def show
    @list = List.find(params[:id])
    authorize @list
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
