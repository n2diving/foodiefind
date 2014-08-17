class CategoryToTruck
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  belongs_to :food_truck
  belongs_to :food_category

end
