class FoodTruck
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :name, type: String
  field :description, type: String
  #field :food_category_ids, type: Array
  field :website, type: String

  field :lat, type: Float, default: nil
  field :long, type: Float, default: nil

  # collection_select(:food_category_id, FoodTruck.all, prompt: true)

  # do I need to define belongs to user_type???
  belongs_to :user
  #has_and_belongs_to_many :food_categories, inverse_of: nil
  # has_many :saved_trucks

  # for active record
  # has_many :users, through: :food_category


end
