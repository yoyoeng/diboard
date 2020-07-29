class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: [:show]


  def show
    
  end

  private

  def set_user
    @user = current_user
  end

end
