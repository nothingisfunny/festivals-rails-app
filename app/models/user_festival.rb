class UserFestival < ActiveRecord::Base
	belongs_to :user
	belongs_to :festival
	scope :interested, -> {where(status: "interested")}
	scope :going, -> {where(status: "going")}
end
