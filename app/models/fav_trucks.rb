class FavTrucks
  include Mongoid::Document

  belongs_to :users
  has_many :food_trucks

end