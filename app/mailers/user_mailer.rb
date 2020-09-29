class UserMailer < ApplicationMailer
  def welcome_email(name,start_t,end_t,date,email)
    @name=name
    @start_t=start_t
    @end_t=end_t
    @date=date
    @email=email
    puts("mailer")
    #puts(user)
    mail(to: email, subject: 'Welcome to My Awesome Site')
  end
end