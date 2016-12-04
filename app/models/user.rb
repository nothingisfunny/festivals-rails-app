class User < ActiveRecord::Base
  has_many :user_festival
  has_many :festivals, through: :user_festival
  has_many :created_festivals, :foreign_key=>"creator_id", class_name: Festival
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
 
  def set_default_role
    self.role ||= :user
  end
  
 def self.from_omniauth(auth)
    where(provider: auth[:provider], uid: auth.uid).first_or_create do |user|
      user.email = auth[:info][:email]
      user.name = auth[:info][:name]
      user.password = Devise.friendly_token[0,20]
    end      
  end
end
