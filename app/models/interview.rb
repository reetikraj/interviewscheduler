class Interview < ApplicationRecord
	
	has_many :interviews_users
	has_and_belongs_to_many :users

	accepts_nested_attributes_for :interviews_users

end
