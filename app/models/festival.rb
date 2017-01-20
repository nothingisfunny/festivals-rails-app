class Festival < ActiveRecord::Base
	belongs_to :category
	belongs_to :world_part
	has_many :user_festival
	has_many :users, through: :user_festival
	has_many :artist_festivals
	has_many :artists, through: :artist_festivals
	belongs_to :creator, class_name: User, :foreign_key=>"creator_id"
	validates :name, :category, :location, :world_part, :line_up, :website, presence: true
	accepts_nested_attributes_for :artists

	def artists_attributes=(artists)
		artists.each do |id, hash|
			artist = Artist.find_or_create_by(name: hash[:name])
		end
	end
end

# What is our attribute writer trying to accomplish
 # This existst on the new festival form
 # Create a new festival
 # add a row with the associations in the artist_festival table
 # find or create the artist by name