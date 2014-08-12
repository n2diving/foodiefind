class FavTrucks
  include Mongoid::Document

  #do I actually need a field type???
  field :name, type: String

  belongs_to :users
  has_many :food_trucks

end