class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :track_title
      t.string :album_title
      t.integer :positive_count
      t.integer :negative_count
      t.string :itunes_url
      t.string :spotify_url
      t.string :soundcloud_url

      t.timestamps
    end
  end
end
