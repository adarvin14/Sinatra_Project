class Artist < ActiveRecord::Base
    belongs_to :library
    has_many :songs
    validates :name, presence: true
end