class FoodCategory
  include Mongoid::Document
  include Mongoid::Paperclip

  field :name, type: String

  has_many :users

  has_mongoid_attached_file :image
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end