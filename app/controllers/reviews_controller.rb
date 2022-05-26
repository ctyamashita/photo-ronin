class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @place = Place.find(params[:place_id])
    @review.place = @place
    @review.user = current_user
    authorize @review

    if @review.save
      redirect_to place_path(@place)
    else
      render 'place/reviews'
    end
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
