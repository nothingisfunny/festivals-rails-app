class FestivalPolicy < ApplicationPolicy
	 attr_reader :festival

	  def initialize(user, festivals)
       super(user, festival)
       @post = record
     end
 
     def update?
       user.admin? || festival.try(:user) == user
     end
     def destroy?
       user.admin? || festival.try(:user) == user
     end
end