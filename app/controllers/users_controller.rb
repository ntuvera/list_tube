class UsersController < ApplicationController

  def index

    @user      = current_user
    @users     = User.all
    @clips     = current_user.clips
    @rec_clips = current_user.shares



    # @sender    = User.find_by(id: 1) # @rec_clips[index].receiver_id) #  <<<<< THIS!!
  end

  def new
    @user = User.new
  end

  def create
    current_user = User.create(user_params)
    redirect_to log_in_path
  end

  def show
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
