class FoodCategory
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :name, type: String

  has_many :category_to_trucks
  accepts_nested_attributes_for :category_to_trucks
  # has_and_belongs_to_many :food_trucks, inverse_of: nil



  def trucks
    FoodTruck.find(truck_ids)
  end

  def truck_ids
    returns = []
    self.category_to_trucks.each do |r|
      returns << r.truck_id if r.truck_id
    end
    returns
  end

  def truck_ids=(list)
    self.category_to_trucks.destroy
    list.each do |truck_id|
      self.category_to_trucks.create(truck_id: truck_id) unless truck_id.blank?
    end
  end

  # workaround for the collection_check_boxes in foodTruck's new-view
  # one leading and 2 trailing spaces
  def name_with_spaces
    ('&nbsp;' + self.name + '&nbsp;&nbsp;').html_safe
  end
end
