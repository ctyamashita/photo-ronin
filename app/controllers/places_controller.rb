class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @places = if params[:address].present?
                # policy_scope(Place.search_by_address_and_name(params[:q]))
                policy_scope(Place.near(params[:address], 200))
              else
                policy_scope(Place.all)
              end
    @markers = set_markers(@places)
  end

  private

  def set_markers(places)
    places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        info_window: render_to_string(partial: 'places/info_window', locals: { place: place })
      }
    end
  end

  def show
    @place = Place.find(params[:id])
    authorize @place
  end
end
