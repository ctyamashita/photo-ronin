class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @places = policy_scope(Place.all)
  end

  def show
    @place = Place.find(params[:id])
    authorize @place

  end
end
