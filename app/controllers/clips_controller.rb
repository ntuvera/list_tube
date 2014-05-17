class ClipsController < ApplicationController

  # before_action:current_user

  def search
     @clips = Clip.search(params[:query])

  end

  def show

    @clips = Clip.search(params[:query])
  end

  def save
    Clip.search(params[:video_id])


    binding.pry

    new_hash = Clip.create({:title => Clip.search(params[:video_id])[:videos][params[:id].to_i]['snippet']['title'],
     :url =>   Clip.search(params[:video_id])[:videos][params[:id].to_i]['id']['videoId'],
    :thumburl =>  Clip.search(params[:video_id])[:videos][params[:id].to_i]['snippet']['thumbnails']['high']['url']})

    binding.pry
    new_hash.save
    redirect_to '/clips/search'
  end

  def destroy
    Song.delete(params[:id])
    redirect_to '/clips/search'
  end

end
