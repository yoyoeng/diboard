class ReviewsController < ApplicationController
    before_action :authenticate_user!

    def create
      movie = Movie.find(params[:movie_id])
      @review = movie.reviews.build(review_params)
      @review.user_id = current_user.id
      if @review.save
        redirect_back(fallback_location: root_path)
      else
        redirect_back(fallback_location: root_path)
      end
    end
  
    private
  
      def review_params
        params.require(:review).permit(:rate, :comment)
      end
end
