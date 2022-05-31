class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @places = Place.all
    # TO DO
    # get average rating from place model
    # sort each place instance by rating (descending order)

    # TO DO
    # assign amount of markers to each place instance (using hash)
    # sort by highest amount of markers
    @recommended = @places.sort_by { |place| -place.average_review }
    @trending = @places.sort_by { |place| -place.markers.count }

    # same thing as @trending above
    # place_with_marker =
    #   @places.map do |place|
    #     {
    #       name: place.name,
    #       address: place.address,
    #       latitude: place.latitude,
    #       longitude: place.longitude,
    #       markers_num: place.markers.count
    #     }
    #   end
    # @trending = place_with_marker.sort_by { |place| -place[:markers_num] }
  end
end
