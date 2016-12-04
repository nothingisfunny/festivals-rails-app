class Festival < ActiveRecord::Base
	belongs_to :category
	belongs_to :world_part
	has_many :user_festival
	has_many :users, through: :user_festival
	belongs_to :creator, class_name: User, :foreign_key=>"creator_id"
end
