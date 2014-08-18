class FoodTruck
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include Mongoid::Search

  search_in :food_categories, :name

  field :name, type: String
  field :description, type: String
  field :food_categories, type: Array
  field :category_ids#, type: Array
  field :website, type: String

  field :lat, type: Float, default: nil
  field :long, type: Float, default: nil

  # collection_select(:food_category_id, FoodTruck.all, prompt: true)

  # do I need to define belongs to user_type???
  belongs_to :user
  #has_and_belongs_to_many :food_categories, inverse_of: nil
  # has_many :saved_trucks

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
      returns << r.category_id if r.category_id
    end
    returns
  end

  # Reset the entire list of category_ids for a given truck
  def category_ids=(list)
    self.save
    self.category_to_trucks.destroy
    list.each do |pastry_id|
      self.category_to_trucks.create(category_id: pastry_id) unless pastry_id.blank?
    end
  end

end
