class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  has_many :blogs
  has_many :comments

  def generate_jwt
    JWT.encode({ id: id, exp: 60.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
  end
end
