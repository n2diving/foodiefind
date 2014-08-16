class FoodCategory
  include Mongoid::Document

  field :name, type: String

  belongs_to :food_trucks

end