class FoodCategory
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :name, type: String

  has_and_belongs_to_many :food_trucks, inverse_of: nil

end
