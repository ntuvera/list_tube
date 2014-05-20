class ClipsController < ApplicationController

  before_action:current_user

  def search
    @clips = Clip.search(params[:query])[:videos].compact
  end

  def save

    @current_user = User.find_by(:name => params[:name])

    clip_id = params.fetch(:clip_id)

    # total workaround, but will fix eventually -- just needed to move foward
    new_clip = Clip.create({
    :title    =>  Clip.search(params[:query])[:videos].compact[params[:clip_id].to_i][:title],
    :url      =>  Clip.search(params[:query])[:videos].compact[params[:clip_id].to_i][:url],
    :thumburl =>  Clip.search(params[:query])[:videos].compact[params[:clip_id].to_i][:thumburl]})

     @user = User.find(session[:user_id])
     @clip = Clip.find(new_clip)
     @user.clips << @clip
     flash[:notice] = 'Event was saved.'


    redirect_to root_path
  end

  def edit

  end

  def destroy
    Clip.delete(params[:id])
    redirect_to root_path
  end

end
