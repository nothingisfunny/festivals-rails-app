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
			self.artists << artist
			artist_festival = ArtistFestival.create(festival_id: self.id, artist_id: artist.id, description: hash[:description])
		end
	end
end
