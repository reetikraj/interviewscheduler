class User < ApplicationRecord
	has_many :connections
	has_and_belongs_to_many :interviews, through: :connections
end
