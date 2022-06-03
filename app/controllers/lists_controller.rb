class ListsController < ApplicationController
  def index
    @lists = policy_scope(List)
  end

  def create
    @place = Place.find(params[:place_id])
    @list = List.new(list_params)
    @list.user = current_user
    authorize @list

    @list = List.create(title: "Create new list", user: current_user) unless @list.save
    # "New_List_#{List.all.any? ? List.last.id : 1}"
    Marker.create(list: @list, place: @place)

    redirect_to place_path(@place), notice: "#{@place.name} has been added to #{@list.title}."
  end

  def show
    @list = List.find(params[:id])
    authorize @list
    @places = @list.places
    # @places = @list.places.sort {|a, b| b.geocode <=> a.geocode}
    # @route = @places.map { |place| place.geocode.map(&:to_s).join(',') }.join('/')
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
