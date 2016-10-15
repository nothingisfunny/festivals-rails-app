class Festival < ActiveRecord::Base
	belongs_to :category
	has_many :user_festivals
	has_many :users, through: :user_festivals
end
