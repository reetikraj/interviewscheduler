class RemindfeatureJob < ApplicationJob
  queue_as :default
  puts("reminder")
  def perform(id)
    # Do something later
    puts(id)
    puts(999999)
    @interview=Interview.find(id)
    user1=@interview.users.first
    user2=@interview.users.last
    puts("###44444444444444444444444444444444")
    @name1=user1.name
    @name2=user2.name
    @start_t=@interview.start_time
    @end_t=@interview.end_time
    @date=@interview.interview_date
    @email1=user1.email
    @email2=user2.email
    if Time.now-interview.start_t <=30.minutes && interview.start_t - Time.now >=25.minutes
    UserMailer.reminder_email(@name1,@start_t,@end_t,@date,@email1).deliver_now
    UserMailer.reminder_email(@name2,@start_t,@end_t,@date,@email2).deliver_now
  end
    
  end
end
