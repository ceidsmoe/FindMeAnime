class User < ActiveRecord::Base
    has_many :o_auth2_credentials, dependent: :destroy
    has_many :watched_animes
end
