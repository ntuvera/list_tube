class WelcomeController < ApplicationController

  before_action:current_user

  def index

    @clips = Clip.all
  end

end
