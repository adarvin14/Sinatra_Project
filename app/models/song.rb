class Song < ActiveRecord::Base
    belongs_to :user
    validates :title, :artist, :release_date, :genre, :album, presence: true
end

#use this as reference for the db:
#songs will have a title, artist, album, release date(year), and genre(s)