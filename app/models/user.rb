class User < ActiveRecord::Base
    has_secure_password
    has_many :songs
    validates :username, :password, presence: true
    validates :username, uniqueness: true
end