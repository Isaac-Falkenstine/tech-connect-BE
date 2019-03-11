class ConfirmationMailer < ApplicationMailer

  def confirm(data)
    @user = User.find(data[:user_id])
    @connection = User.find(data[:connection_id])
    @data = data
    @data[:datetime] = Time.parse(data[:meeting_date]).strftime("%m/%d/%Y %I:%M %p")
    mail(to: [@user.email, @connection.email], subject: "You have a confirmed meeting through TechConnect")
  end

  def decline(data)
    @user_email = User.find(data[:user_id]).email
    @connection_name = User.find(data[:connection_id]).name
    @data = data
    mail(to: @user_email, subject: "#{@connection_name} requests a raincheck")
  end

end
