class FoodTruck
  include Mongoid::Document

  field :name, type: String
  field :description, type: String
  field :food_categories, type: Array
  field :website, type: String
  
  field :lat, type: Float, default: nil
  field :long, type: Float, default: nil

  # collection_select(:food_category_id, FoodTruck.all, prompt: true)

  # do I need to define belongs to user_type???
  belongs_to :user

  has_many :category_to_trucks
  accepts_nested_attributes_for :category_to_trucks  # has_many :saved_trucks 

  # for active record
  # has_many :users, through: :food_category


  def food_categories
    FoodCategory.find(category_ids)
  end

  # Only find the category_ids for a given truck
  def category_ids
    returns = []
    self.category_to_trucks.each do |r|
      returns << r.pastry_id if r.pastry_id
    end
    returns
  end

  # Reset the entire list of category_ids for a given truck
  def category_ids=(list)
    self.save
    self.category_to_trucks.destroy
    list.each do |pastry_id|
      self.category_to_trucks.create(category_id: category_id) unless category_id.blank?
    end
  end

end
