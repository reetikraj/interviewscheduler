class Interview < ApplicationRecord
	
	has_many :interviews_users
	has_and_belongs_to_many :users

	accepts_nested_attributes_for :interviews_users
    
    validates :interview_date, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true

    validate :end_before_start
    validate :conflicts

    private
    	
    	def end_before_start
    		if end_time<=start_time
    			errors.add(:end_time, "must be after start time")
    		end
    	end

    	def conflicts
    		
    		cur_start = start_time.to_i + interview_date.to_time.to_i
    		cur_end = end_time.to_i + interview_date.to_time.to_i
             
            user1check = User.where(:email => users.first.email).first
            user2check = User.where(:email => users.last.email).first

            if user1check
                schedules = User.where(:id => user1check.id).first.interviews
                schedules.each do |schedule|
                    schedule_start = schedule.start_time.to_i + schedule.interview_date.to_time.to_i
                    schedule_end = schedule.end_time.to_i + schedule.interview_date.to_time.to_i

                    if (cur_start >= schedule_start && cur_start <= schedule_end) || ((cur_end >= schedule_start && cur_end <= schedule_end))
                        errors.add(:start_time, "conflicts ")
                    end
                end    
            end

            if user2check
                schedules = User.where(:id => user2check.id).first.interviews
                schedules.each do |schedule|
                    schedule_start = schedule.start_time.to_i + schedule.interview_date.to_time.to_i
                    schedule_end = schedule.end_time.to_i + schedule.interview_date.to_time.to_i

                    if (cur_start >= schedule_start && cur_start <= schedule_end) || ((cur_end >= schedule_start && cur_end <= schedule_end))
                        errors.add(:start_time, "conflicts ")
                    end
                end    
            end
        end



end
