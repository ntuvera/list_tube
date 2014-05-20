class WelcomeController < ApplicationController

  before_action:current_user

  def index
binding.pry
    @user  = User.find_by(:name => params[:name])
    @users = User.all
    if current_user.clips.nil?
      @clips = []
    else
      @clips = current_user.clips
    end
  end

end
