class AlbumsController < ApplicationController
  def index
    if user_signed_in?
      @albums = Album.where(user_id: current_user.id)
    else
      redirect_to new_user_session_path
    end
  end

  def show
    artists_service = ArtistsService.new
    all_artists = artists_service.get_all_artists
    @album = Album.find(params[:id])
    @album_artists = all_artists.select { |artist| @album.artists_ids.include?(artist['id']) }
    @artists = all_artists.reject { |artist| @album.artists_ids.include?(artist['id']) }
  end

  def new
    @album = Album.new
  end

  def remove_artist
    @album = Album.find(params[:id])

    artist_id = params[:artist_id]
    @album.artists_ids.delete(artist_id.to_i)

    if @album.save
      redirect_to @album, notice: "Artist removed successfully!"
    else
      redirect_to @album, notice: "Something went wrong! Try again later."
    end
  end

  def add_artist
    @album = Album.find(params[:id])
    artist_id = params[:artist_id]
    @album.artists_ids << artist_id unless @album.artists_ids.include?(artist_id)

    if @album.save
      redirect_to @album, notice: "Artist added successfully!"
    else
      redirect_to @album, notice: "Something went wrong! Try again later."
    end
  end

  def create
    @user = User.find(current_user.id)
    @album = Album.new(album_params)
    @album.user_id = @user.id
    if @album.save
      redirect_to @album
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def album_params
    params.require(:album).permit(:name, :year)
  end
end
