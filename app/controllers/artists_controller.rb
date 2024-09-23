class ArtistsController < ApplicationController
  def index
    hash = ArtistsService.new
    @artists = hash.get_all_artists
  end
end
