class Festival < ActiveRecord::Base
	belongs_to :category
	has_many :user_festival
	has_many :users, through: :user_festival
end
