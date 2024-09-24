class AlbumsController < ApplicationController
  def index
    @albums = Album.where(user_id: current_user.id)
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
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
