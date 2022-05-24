class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @places = policy_scope(Place.all)
  end
end
