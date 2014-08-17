class CategoryToTruck
  include Mongoid::Document

  belongs_to :food_truck
  belongs_to :food_category

end