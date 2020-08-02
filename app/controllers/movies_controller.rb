class MoviesController < ApplicationController
    def index
      @movies = Movie.all
      @search_params = movie_search_params
      @movies = Movie.search(@search_params).includes(:site)
      @movies = Movie.search(@search_params).includes(:country)


    end

    def new
      @movie = Movie.new
    end

    def create
      @movie = Movie.new(movie_params)
      @movie.user_id =current_user.id
      if @movie.save
        redirect_to :action => "index"
      else
        redirect_to :action => "new"
      end
    end

    def show
      @movie = Movie.find(params[:id])
      @reviews = @movie.reviews
      @review = @movie.reviews.build
      @tags = @movie.tags
      @tag = @movie.tags.build
      @vote = Vote.new
      @tag_count = Tag.find(Vote.group(:tag_id).order('count(tag_id)desc').pluck(:tag_id)).select{|tag| tag.movie_id == @movie.id}
      @votes = Vote.where(user_id: current_user)

      @review_rate = Review.select{|review| review.movie_id == @movie.id}.pluck(:rate)
      if @review_rate.empty?
        @review_average = 0
      else
        @review_average = @review_rate.inject(:+)/@review_rate.size.to_f
      end
      
      
    end

    def edit
      @movie = Movie.find(params[:id])
    end

    def update
      @movie = Movie.find(params[:id])
      if @movie.update(movie_params)
        redirect_to :action => "show", :id => @movie.id
      else
        redirect_to :action => "new"
      end
    end

    def destroy
      Movie.find(params[:id]).destroy
      redirect_to action: :index
    end
    
    
    private
    def movie_params
      params.require(:movie).permit(:title, :sentence, :image, :country_id, :site_id, tag_ids: [])
    end
    def movie_search_params
      params.fetch(:search, {}).permit(:name, :country_id, :site_id)
    end
    
end
