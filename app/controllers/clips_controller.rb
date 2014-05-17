class ClipsController < ApplicationController

  # before_action:current_user

  def search
    @clips = Clip.search(params[:query])
  end

  def save

    new_clip = Clip.create({:title => Clip.search(params[:query])[:videos][params[:video_id]]['snippet']['title'],
    :url =>   Clip.search(params[:query])[:videos][params[:video_id]]['id']['videoId'],
    :thumburl =>  Clip.search(params[:query])[:videos][params[:video_id]]['snippet']['thumbnails']['high']['url']})

    # new_clip = Clip.create({:title => Clip.search(params[:video_id])[:videos][params[:id]]['snippet']['title'],
    # :url =>   Clip.search(params[:video_id])[:videos][params[:id]]['id']['videoId'],
    # :thumburl =>  Clip.search(params[:video_id])[:videos][params[:id]]['snippet']['thumbnails']['high']['url']})
    # new_clip.save
    # @current_user.clips << new_clip
    user.clips << new_clip
    redirect_to '/clips/search'
  end

  def destroy
    Song.delete(params[:id])
    redirect_to '/clips/search'
  end

end
