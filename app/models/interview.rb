class Interview < ApplicationRecord
	has_many :subjects
	has_and_belongs_to_many :users, through: :subjects
end
