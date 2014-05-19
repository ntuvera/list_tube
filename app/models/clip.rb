
require 'google/api_client'


class Clip < ActiveRecord::Base

    has_and_belongs_to_many :users, through: :clips_users

  def self.search(query)

    #  Set up a google api client object
    client = Google::APIClient.new(:key => DEVELOPER_KEY,
                                   :authorization => nil)
    youtube = client.discovered_api('youtube', 'v3')


    # Set up some options for my query
    opts = { :q => query, :maxResults => 25, :part => 'id,snippet'}

    # Make the request
    search_response = client.execute!(
      :api_method => youtube.search.list,
      :parameters => opts
    )

    # Parse response into videos, channels, playlists
    videos = []
    channels = []
    playlists = []

    search_response.data.items.each do |search_result|
      case search_result.id.kind

        when 'youtube#video'

          video_hash = search_result.to_hash

          clean_hash = {
            title: video_hash['snippet']['title'],
            url: video_hash['id']['videoId'],
            thumburl: video_hash['snippet']['thumbnails']['high']['url']
          }

          videos.push(clean_hash)
          # videos.push(search_result.to_hash)
        when 'youtube#channel'
          videos.push(clean_hash)
          # channels.push(search_result.to_hash)
        when 'youtube#playlist'
          videos.push(clean_hash)
          # playlists.push(search_result.to_hash)
      end
    end

    return{
      videos: videos,
      channels: channels,
      playlists: playlists
    }

    # Clip.new({:title => Clip.search(params[:query])[:videos][params[:clip_id]]['snippet']['title'],
    #   :url => Clip.search(params[:query])[:videos][params[:clip_id].['id']['videoId'],
    #   :thumburl =>  Clip.search(params[:query])[:videos][params[:clip_id]]['snippet']['thumbnails']['high']['url']})

    clip_hash ={
      title: Clip.search(params[:query])[:videos][params[:clip_id]]['snippet']['title'],
      url: Clip.search(params[:query])[:videos][params[:clip_id]]['id']['videoId'],
      thumburl: Clip.search(params[:query])[:videos][params[:clip_id]]['snippet']['thumbnails']['high']['url']
    }

    Clip.new(clip_hash)
  end

  private

    DEVELOPER_KEY = "AIzaSyBvF2xGX9WCO9E-5yjphgC_j9fecYQjxnk"

end
