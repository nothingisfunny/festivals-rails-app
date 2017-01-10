class CreateArtistFestivals < ActiveRecord::Migration
  def change
    create_table :artist_festivals do |t|
      t.integer :artist_id
      t.integer :festival_id
      t.timestamps null: false
    end
  end
end
