class TagsController < ApplicationController
    before_action :authenticate_user!

    def create 
        movie = Movie.find(params[:movie_id])
        @tag = movie.tags.build(tag_params)
        @tag.users << current_user
        if @tag.save 
           redirect_back(fallback_location: root_path) 
        else 
           redirect_back(fallback_location: root_path) 
        end 
      #   @vote = Vote.new
      #   @vote.users << current_user
      #   if @vote.save 
      #      redirect_back(fallback_location: root_path) 
      #   else 
      #      redirect_back(fallback_location: root_path) 
      #   end 
      end 
   
    
   private 

      def tag_params 
        params.require(:tag).permit(:content,:user_id)
      end   
      
end
