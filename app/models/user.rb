# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  f_name          :string
#  l_name          :string
#  motto           :string
#  receive_emails  :boolean          default(FALSE)
#  current_points  :integer          default(0)
#  access_type     :string           default("user")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_digest, presence: true
  validates :password, length: { minimum: 4, allow_nil: true }
  # after_initialize :ensure_jwt
  attr_reader :password

  def self.find_by_credentials(username, password)
    # ruby's method missing to generate this method
    user = User.find_by_username(username)
    return user if user && user.is_password?(password)
    nil
  end

  # def self.generate_jwt(username)
  #   # generate jwt with 24 hour expiry limit, and username as lookups - should add email as well later
  #   payload = {
  #     username: username,
  #     exp: 24.hours.from_now.to_i
  #   }
  #   JWT.encode(payload, Rails.application.secrets.secret_key_base)
  #   debugger
  # end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token
    self.session_token = nil
    self.save!
    self.session_token
  end

  # def ensure_jwt
  #   debugger
  #   self.session_token ||= User.generate_jwt(self.username)
  # end


end
