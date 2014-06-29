require 'google/api_client'

class Clip < ActiveRecord::Base

  DEVELOPER_KEY = "AIzaSyBvF2xGX9WCO9E-5yjphgC_j9fecYQjxnk"

  has_and_belongs_to_many :users, through: :faves
  has_and_belongs_to_many :users, through: :clips_users
  has_many :shares

  def self.search(query)
    client = Google::APIClient.new(:key => DEVELOPER_KEY,
                                   :authorization => nil)
    youtube = client.discovered_api('youtube', 'v3')

    opts = { :q => query, :maxResults => 25, :part => 'id,snippet'}

    search_response = client.execute!(
                                      :api_method => youtube.search.list,
                                      :parameters => opts
                                     )

    # This kind of comment indicates that there is logic that should be
    # moved to a different function.
    # There is no reason for "search" to also do "parse", though it's OK if
    # you call 'parse' inside of 'search'.

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
      when 'youtube#channel'
        videos.push(clean_hash)
      when 'youtube#playlist'
        videos.push(clean_hash)
      end
    end

    return{
           videos: videos,
           channels: channels,
           playlists: playlists
          }

    clip_hash = {
                title: Clip.search(params[:query])[:videos][params[:clip_id]]['snippet']['title'],
                url: Clip.search(params[:query])[:videos][params[:clip_id]]['id']['videoId'],
                thumburl: Clip.search(params[:query])[:videos][params[:clip_id]]['snippet']['thumbnails']['high']['url']
               }

    Clip.new(clip_hash)
  end

end
