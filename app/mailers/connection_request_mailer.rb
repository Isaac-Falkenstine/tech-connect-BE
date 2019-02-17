class ConnectionRequestMailer < ApplicationMailer

  def connect(data)
    binding.pry
    @email = User.find(data[:connection_id]).email
    @user = User.find_by(api_key: data[:api_key])
    @data = data
    mail(to: @email, subject: "#{@user.name} is requesting a connection")
  end
end
