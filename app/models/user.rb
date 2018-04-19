class User < ApplicationRecord
  has_secure_password
  has_one :venue

  def self.find_or_create_by_omniauth(auth_hash)
    if user = User.find_by(username: auth_hash["uid"])
      user
    else
      User.create(username: auth_hash["uid"], password: SecureRandom.hex)
    end
  end
end
