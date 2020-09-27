class User < ApplicationRecord
	
	has_many :interviews_users
	has_and_belongs_to_many :interviews
	
end
