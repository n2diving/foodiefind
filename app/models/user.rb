class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  field :user_type, type: String

  #is this belongs_to or has_many???
  # belongs_to :food_category
  belongs_to :saved_trucks

  # for active record
  # has_many :food_trucks, through: :food_category

  def food_trucks
    FoodTruck.find( food_truck_ids )
  end

  def food_truck_ids
    self.food_categories.map(&:food_truck_id)
  end

  # this is to write back a list of food trucks we ???
  def food_truck_ids=(list)

  end

  has_secure_password

end


# has_mongoid_attached_file :image
#   validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
#   validates_presence_of :username, :email, :password, :password_confirmation
#   validates :username, length: { in: 3..10 }
#   validates :password, length: { in: 5..12 }
#   validates_format_of :email, :with => /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i
#   validates_format_of :username, :with => /\A[a-zA-Z]+\z/
#   validates_uniqueness_of :username, :email
