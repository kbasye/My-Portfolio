require 'securerandom'
class User < ActiveRecord::Base
  attr_accessible :password, :username
  has_secure_password

  before_create :generate_token
  def generate_token
    self.auth_token = SecureRandom.hex(16)
  end
  
end
