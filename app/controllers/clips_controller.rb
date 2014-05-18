class ClipsController < ApplicationController

  before_action:current_user

  def search
    @clips = Clip.search(params[:query])
  end

  def save

    clip = Clip.search(params[:query])
    # binding.pry
    # new_clip = Clip.create(
    # :title => Clip.search(params[:query])[:videos][params[:video_id]]['snippet']['title'],
    # :url =>   Clip.search(params[:query])[:videos][params[:video_id]]['id']['videoId'],
    # :thumburl =>  Clip.search(params[:query])[:videos][params[:video_id]]['snippet']['thumbnails']['high']['url'])
    # current_user.clips << new_clip


binding.pry
    new_clip = Clip.create({:title => Clip.search(params[:query])[:videos][params["clip_id"]][:title],
    :url =>   Clip.search(params[:query])[:videos][params["clip_id"]][:url],
    :thumburl =>  Clip.search(params[:query])[:videos][params["clip_id"]][:thumburl]})
    new_clip.save
    @current_user.clips << new_clip

    redirect_to root_path
  end

  def destroy
    Song.delete(params[:id])
    redirect_to '/clips/search'
  end

end
