class VotesController < ApplicationController
    def create
        @vote = current_user.votes.create(vote_params)
        redirect_back(fallback_location: root_path)
        flash[:notice] = "投票完了"
      end

    private 

      def vote_params 
        params.require(:vote).permit(:user_id, :tag_id)

        # { :tag_id => []}
      end   
      
end
