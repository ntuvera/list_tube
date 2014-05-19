class ClipsController < ApplicationController

  before_action:current_user

  def search
    @clips = Clip.search(params[:query])[:videos].compact

  end

  def save
    @clips = Clip.search(params[:query])[:videos]
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
    # totally unsecure hack, but will fix eventually -- just needed to move foward
    new_clip = Clip.create({
    :title =>     Clip.search(params[:query])[:videos][params[:clip_id].to_i][:title],
    :url =>       Clip.search(params[:query])[:videos][params[:clip_id].to_i][:url],
    :thumburl =>  Clip.search(params[:query])[:videos][params[:clip_id].to_i][:thumburl]})
    new_clip.save
    @current_user.clips << new_clip

    redirect_to root_path
  end

  def destroy
    Clip.delete(params[:id])
    redirect_to root_path
  end

end
