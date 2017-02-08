class SongsController < ApplicationController
  before_action :set_artist, only: [:index, :new, :edit, :create, :update]
  before_action :set_song, only: [:edit, :update]

  def index
    @songs = @artist.songs
  end

  def new
    @song = @artist.songs.new
  end

  def edit
  end

  def show
    @song = Song.find(params[:id])
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def update
    if @song.update_attributes(song_params)
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  private
  def song_params
    params.require(:song).permit(:title)
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def set_song
    @song = @artist.songs.find(params[:id])
  end
end
