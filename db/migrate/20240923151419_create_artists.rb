class CreateArtists < ActiveRecord::Migration[7.2]
  def change
    create_table :artists, id: false do |t|
      t.string :name
      t.integer :id
      t.string :twitter

      t.timestamps
    end
  end
end
