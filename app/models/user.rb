class User < ApplicationRecord
	
	has_many :interviews_users
	has_and_belongs_to_many :interviews

	validates :name, presence: true
	validates :email, presence: true

	has_attached_file :resume
	validates_attachment :resume, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}

end
