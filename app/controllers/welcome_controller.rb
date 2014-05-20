class WelcomeController < ApplicationController

  before_action:current_user

  def index

    @user  = User.find(session[:user_id]) if session[:user_id]
    @users = User.all
    current_user = @user

    if current_user.clips == nil
      current_user.clips =[]
    else
      @clips = current_user.clips
    end

  end
end
