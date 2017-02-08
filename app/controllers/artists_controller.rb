class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def show
  end

  def edit
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to "/artists/#{@artist.id}"
    else
      render :new
    end
  end

  def update
    if @artist.update_attributes(artist_params)
      redirect_to "/artists/#{@artist.id}"
    else
      render :edit
    end
  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :image_path)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end
end
