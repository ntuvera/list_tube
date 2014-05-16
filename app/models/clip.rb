
require 'google/api_client'


class Clip < ActiveRecord::Base

    has_many :shares


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

          # video_hash = search_result.to_hash

          # clean_hash = {
          #   image: video_hash['snippet']['thumbnails']['high']['url'],
          #   titl:
          # }

          # videos.push(clean_hash)

          videos.push(search_result.to_hash)
        when 'youtube#channel'
          channels.push(search_result.to_hash)
        when 'youtube#playlist'
          playlists.push(search_result.to_hash)
      end
    end

    return{
      videos: videos,
      channels: channels,
      playlists: playlists
    }

    Clip.new({:title => Clip.search(params[:query])[:videos][0]['snippet']['title'], :url => Clip.search(params[:query])[:videos][0]['id']['videoId']})

  end

  private

    DEVELOPER_KEY = "AIzaSyBvF2xGX9WCO9E-5yjphgC_j9fecYQjxnk"

end
