class UsersController < ApplicationController

  def index
    @user      = current_user
    @users     = User.all
    @clips     = current_user.clips
    @rec_clips = current_user.shares
    @senders   = User.where.not(name: current_user.name)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to log_in_path
    else
      render 'new'
    end
  end

  def show
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
