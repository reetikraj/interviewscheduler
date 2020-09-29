class UserMailer < ApplicationMailer
  def welcome_email(name,start_t,end_t,date,email)
    @name=name
    @start_t=start_t
    @end_t=end_t
    @date=date
    @email=email
    mail(to: email, subject: 'Your interview is scheduled')
  end
  def reminder_email(name,start_t,end_t,date,email)
    @name=name
    @start_t=start_t
    @end_t=end_t
    @date=date
    @email=email
    mail(to: email, subject: 'Reminder for your interview')
  end
  def cancel_email(name,start_t,end_t,date,email)
    @name=name
    @start_t=start_t
    @end_t=end_t
    @date=date
    @email=email
    mail(to: email, subject: 'Your interview has been cancelled')
  end
  def update_email(name,start_t,end_t,date,email)
    @name=name
    @start_t=start_t
    @end_t=end_t
    @date=date
    @email=email
    mail(to: email, subject: 'Your interview has been updated')
  end
  

end