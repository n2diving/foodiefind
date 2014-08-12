class CategoryConnection
  include Mongoid::Document

  field :name, type: String

  has_many :users
  has_many :food_trucks

end