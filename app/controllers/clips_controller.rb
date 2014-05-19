class ClipsController < ApplicationController

  before_action:current_user

  def search
    @clips = Clip.search(params[:query])[:videos].compact
  end

  def save

    @current_user = User.find_by(:name => params[:name])

    # @clips = Clip.find(params[:id])
    # clip = Clip.search(params[:query])
    # binding.pry
    # new_clip = Clip.create(
    # :title => Clip.search(params[:query])[:videos][params[:video_id]]['snippet']['title'],
    # :url =>   Clip.search(params[:query])[:videos][params[:video_id]]['id']['videoId'],
    # :thumburl =>  Clip.search(params[:query])[:videos][params[:video_id]]['snippet']['thumbnails']['high']['url'])
    # current_user.clips << new_clip

    clip_id = params.fetch(:clip_id)

    new_clip = Clip.new
    # total workaround, but will fix eventually -- just needed to move foward
    new_clip = Clip.create({
    :title    =>  Clip.search(params[:query])[:videos][params[:clip_id].to_i][:title],
    :url      =>  Clip.search(params[:query])[:videos][params[:clip_id].to_i][:url],
    :thumburl =>  Clip.search(params[:query])[:videos][params[:clip_id].to_i][:thumburl]})
binding.pry
    # @clip = Clip.new(params[:clip_id])
    # current_user.clips << @clip
    # ClipUser.create({user_id: => current_user.id, clip_id: => params[clip.id}])
     # @current_user.clips << new_clip
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
