class AuthenticateUser
  prepend SimpleCommand
  attr_accessor :username, :password

  def initialize(username, password)
    @username = username
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end


end
