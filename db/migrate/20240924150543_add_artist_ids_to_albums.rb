class AddArtistIdsToAlbums < ActiveRecord::Migration[7.2]
  def change
    add_column :albums, :artists_ids, :integer, array: true, default: []
  end
end
