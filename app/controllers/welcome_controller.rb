class WelcomeController < ApplicationController

  before_action:current_user

  def index

    @user  = User.find_by(:name => params[:name])
    @users = User.all
    @clips = current_user.clips
  end

end
