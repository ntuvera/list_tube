class ClipsController < ApplicationController


  def search
    # @clips = Clip.search(params[:query])

    # @title = @clips[:videos][0]['snippet']['title']

  end

  def results
    @clips = Clip.search(params[:query])
  end

  def save
    # new_clip= Clip.search(params[:query])
    new_hash = {:title => Clip.search(params[:query])[:videos][0]['snippet']['title'], :url => Clip.search(params[:query])[:videos][0]['id']['videoId']}
    @user.clips << new_hash
    redirect_to root_path
  end
end
