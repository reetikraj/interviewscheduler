class CancelfeatureJob < ApplicationJob
  queue_as :default
 
  def perform(id)
    @name1=user1.name
    @name2=user2.name
    @start_t=@interview.start_time
    @end_t=@interview.end_time
    @date=@interview.interview_date
    @email1=user1.email
    @email2=user2.email
    
    UserMailer.cancel_email(@name1,@start_t,@end_t,@date,@email1).deliver_now
    UserMailer.cancel_email(@name2,@start_t,@end_t,@date,@email2).deliver_now
    
  end
  
end