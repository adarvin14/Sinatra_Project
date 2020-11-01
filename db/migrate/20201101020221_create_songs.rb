class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :genre
      t.string :album
      t.datetime :release_date
      t.integer :user_id
    end
  end
end
