class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  field :user_type, type: String

  #is this belongs_to or has_many???
  # belongs_to :food_category
  belongs_to :fav_trucks

  # for active record
  # has_many :food_trucks, through: :food_category

  def food_trucks
    FoodTruck.find( food_truck_ids )
  end

  def food_truck_ids
    self.food_categories.map(&:food_truck_id)
  end

  # this is to write back a list of food trucks we ???
  def food_truck_ids=(list)

  end

  has_secure_password

end
