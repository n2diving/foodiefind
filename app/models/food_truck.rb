class FoodTruck
  include Mongoid::Document

  field :name, type: String
  field :description, type: String
  field :food_categories, type: String

  # collection_select(:food_category_id, FoodTruck.all, prompt: true)

  # do I need to define belongs to user_type???
  belongs_to :user
  has_many :food_categories
  # has_many :fav_trucks 

  # for active record
  # has_many :users, through: :food_category


end
