class FoodTruck
  include Mongoid::Document

  before_create :check

   protected
   def check
    if self.name
      #need some kind of alert or redirect???
    else
      self.name
   end

  field :name, type: String

  # do I need to define belongs to user_type???
  belongs_to :user
  has_many :food_categories
  has_many :fav_trucks 

  # for active record
  # has_many :users, through: :food_category


end
