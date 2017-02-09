class PlaylistsController < ApplicationController
  before_action :set_user
  before_action :set_playlist, only: [:show, :edit, :update]
  before_action :set_songs, only: [:new, :create, :edit]

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def show
  end

  def edit
  end

  def create
    @playlist = @user.playlists.build(playlist_params)
    if @playlist.save
      redirect_to user_playlist_path(@user, @playlist)
    else
      render :new
    end
  end

  def update
    if @playlist.update_attributes(playlist_params)
      redirect_to user_playlist_path(@user, @playlist)
    else
      render :edit
    end
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, song_ids: [])
  end

  def set_playlist
    @playlist = @user.playlists.find(params[:id])
  end

  def set_songs
    @songs = Song.all
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
