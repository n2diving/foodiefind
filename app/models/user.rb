class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  field :user_type, type: String
  belongs_to :food_category

  has_secure_password

end
