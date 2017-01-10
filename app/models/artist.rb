class Artist < ActiveRecord::Base
	has_many :festivals, through: :artist_festivals
	has_many :artist_festivals
end
