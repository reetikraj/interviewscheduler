class MailingfeatureJob < ApplicationJob
  queue_as :default
  puts("itna")
  def perform(id)
    # Do something later
    puts(id)
    puts(999999)
    @interview=Interview.find(id)
    user1=@interview.users.first
    user2=@interview.users.last
    puts("###333333333333333333333333333333333333333333")
    @name1=user1.name
    @start_t=@interview.start_time
    @end_t=@interview.end_time
    @date=@interview.interview_date
    @email1=user1.email
    puts(user1.name)
    puts(user1.email)
    puts(user2.name)
    puts(user2.email)
    puts(@interview)
    puts(5000)
    UserMailer.welcome_email(@name1,@start_t,@end_t,@date,@email1).deliver_now
    #puts(email)
    #user1 = User.where(:email => email)
    #name = User.
    #puts(user1)
    #puts(user1.email)
  end
end
