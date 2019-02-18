class ConfirmationMailer < ApplicationMailer

  def confirm(data)
    @user_email = User.find(data[:user_id]).email
    @connection_email = User.find(data[:connection_id]).email
    @data = data
    mail(to: @user_email, subject: "You have a confirmed meeting with #{@connection_email}")
    mail(to: @connection_email, subject: "You have a confirmed meeting with #{@user_email}")
  end

  def decline(data)
    @user_email = User.find(data[:user_id]).email
    @connection_name = User.find(data[:connection_id]).name
    @data = data
    mail(to: @user_email, subject: "#{@connection_name} must Raincheck your requested meeting")
  end

end
