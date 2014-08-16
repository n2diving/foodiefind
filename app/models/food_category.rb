class FoodCategory
  include Mongoid::Document

  field :name, type: String
  field :_id, type: Moped::BSON::ObjectId

  belongs_to :food_trucks

end