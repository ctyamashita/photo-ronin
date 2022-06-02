class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :form_instances, only: :show

  def index
    @places = if params[:address].present?
                # policy_scope(Place.search_by_address_and_name(params[:q]))
                policy_scope(Place.near(params[:address], 200))
              else
                policy_scope(Place.all)
              end

    @places = if params[:search].nil? || params[:search][:tag_list].count <= 1
                @places
              else
                @places.tagged_with(params[:search][:tag_list][1..])
              end
    @pins = create_markers(@places)
  end

  def show
    @place = Place.find(params[:id])
    authorize @place
    @lists = current_user.lists.where.not(id: @place.lists).order(created_at: :desc) if current_user
    # @pin = create_marker(@place)
    @pin = create_photo_pins(@place)
  end

  def create
    @place = Place.new(place_params)
    authorize @place

    # using geocoder (comment this part and change the new_place.html.erb)
    @geocoder_info = Geocoder.search(params[:place][:address])[1]
    if @geocoder_info
      @place.latitude = @geocoder_info.latitude
      @place.longitude = @geocoder_info.longitude
      @place.address = @geocoder_info.address
    end
    ##

    if @place.save
      redirect_to place_path(@place), notice: "#{@place.name} has been added"
    else
      if Place.where(name: @place.name).any?
        redirect_to place_path(Place.where(name: @place.name).first), notice: "#{@place.name} already exists"
      else
        redirect_to places_path, notice: "Please enter a valid address"
      end
    end
  end

  def tagged
    if params[:tag].present?
      @places = Place.tagged_with(params[:tag])
    else
      @places = Place.all
    end
    authorize @places
    @pins = create_markers(@places)
    render 'places/index'
  end

  private

  def create_markers(places)
    places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        info_window: render_to_string(partial: 'places/info_window', locals: { place: place }),
        custom_marker: render_to_string(partial: 'places/marker', locals: { photo: place })
      }
    end
  end

  def create_marker(place)
    {
      lat: place.latitude,
      lng: place.longitude,
      info_window: render_to_string(partial: 'places/info_window', locals: { place: place }),
      custom_marker: render_to_string(partial: 'places/marker', locals: { photo: place })
    }
  end

  def create_photo_pins(place)
    if place.photos.any?
      place.photos.map do |photo|
        {
          lat: photo.latitude,
          lng: photo.longitude,
          image_url: helpers.cl_image_path(photo.photo.key),
          info_window: render_to_string(partial: 'places/info_window_photo', locals: { photo: photo }),
          custom_marker: render_to_string(partial: 'places/marker', locals: { photo: photo })
        }
      end
    else
      [{
        lat: place.latitude,
        lng: place.longitude,
        info_window: render_to_string(partial: 'places/info_window', locals: { place: place }),
        custom_marker: render_to_string(partial: 'places/marker', locals: { photo: place })
      }]
    end
  end



  def place_params
    params.require(:place).permit(:name, :address, tag_list: [])
  end

  def form_instances
    @list = List.new
    @review = Review.new
    @marker = Marker.new
    @photo = Photo.new
  end
end
