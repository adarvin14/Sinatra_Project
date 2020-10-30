class Library < ActiveRecord::Base
    belongs_to :user
    has_many :songs, through :artist
    has_many :artists
end