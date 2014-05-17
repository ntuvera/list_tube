class WelcomeController < ApplicationController

  # before_action:current_user

  def index
    @current_user = User.all
    @clips = Clip.all
  end

end
