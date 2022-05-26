class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @places = if params[:address].present?
                # policy_scope(Place.search_by_address_and_name(params[:q]))
                policy_scope(Place.near(params[:address], 200))
              else
                policy_scope(Place.all)
              end
    @pins = create_markers(@places)
  end

  def show
    @place = Place.find(params[:id])
    authorize @place
    @marker = Marker.new
    @lists = current_user.lists.where.not(id: @place.lists)
    @list = List.new
  end

  def create
    @place = Place.new(place_params)
    authorize @place
    if @place.save
      redirect_to place_path(@place), notice: "#{@place.name} has been added"
    else
      if Place.where(name: @place.name).any?
        redirect_to place_path(Place.where(name: @place.name).first), notice: "#{@place.name} already exists"
      else
        redirect_to places_path
      end
    end
  end

  private

  def create_markers(places)
    places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        info_window: render_to_string(partial: 'places/info_window', locals: { place: place })
      }
    end
  end

  def place_params
    params.require(:place).permit(:name, :address)
  end
end
