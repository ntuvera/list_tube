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
     flash[:notice] = 'Clip saved'


    redirect_to play_lists_path
  end

  def edit #send clip to user
    @clip = Clip.find(params[:id])


  end

  def destroy # delete from current_user playlist
binding.pry
    clip = Clip.find(params[:id])

    current_user.clips.delete(clip)


    # @clip = current_user.shares
    # ClipsUser.destroy(@clip)
    redirect_to play_lists_path
  end

end
