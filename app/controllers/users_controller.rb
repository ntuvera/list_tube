class UsersController < ApplicationController

  def index
binding.pry
    @user      = current_user
    @users     = User.all
    @clips     = current_user.clips
    @rec_clips = current_user.shares
    # @title_id  = @rec_clips[index].clip_id
    # @title     = Clip.find_by(id: @title_id)
    # Clip.find_by(id: current_users.shares[0].clip_id).title



    # @sender    = User.find_by(id: 1) # @rec_clips[index].receiver_id) #  <<<<< THIS!!
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
