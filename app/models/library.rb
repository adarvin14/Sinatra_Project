class Library < ActiveRecord::Base
    belongs_to :user
    has_many :songs, through :artists
    has_many :artists
end