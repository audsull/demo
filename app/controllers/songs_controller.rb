class SongsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_via_token

  def index
    @songs = Song.all
    render json: @songs
  end

  def show
    @song = set_song
    render json: @song
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      render json: @song, status: :success
    else
      render json: 'Error'
    end
  end

  def update
    @song = set_song
    @song.update(song_params)
    if @song.save
      render json: @song, status: :success
    else
      render json: 'Error'
    end
  end

  private

  def song_params
    params.require(:song).permit(:artist, :track_title, :album_title, :itunes_url, :spotify_url, :soundcloud_url)
  end

  def set_song
    Song.find_by(id: params.dig(:id))
  end
end
