class ConnectionRequestMailer < ApplicationMailer

  def connect(data)
    @connection = User.find(data[:connection_id])
    @user = User.find_by(api_key: data[:api_key])
    @data = data
    @data[:datetime_1] = Time.parse(data[:datetime_1]).strftime("%m/%d/%Y %I:%M %p")
    @data[:datetime_2] = Time.parse(data[:datetime_2]).strftime("%m/%d/%Y %I:%M %p")
    @data[:datetime_3] = Time.parse(data[:datetime_3]).strftime("%m/%d/%Y %I:%M %p")

    mail(to: @connection.email, subject: "#{@user.name} is requesting a connection")
  end
end
