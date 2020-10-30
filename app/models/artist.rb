class Artist < ActiveRecord::Base
    has_many :songs
    validates :name, presence: true
end

#reference for db file: 