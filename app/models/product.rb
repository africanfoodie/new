class Product < ActiveRecord::Base

  mount_uploader :image, ImageUploader
  has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg"


  validates :title, :description, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
 

  belongs_to :user
  has_many :orders
  # scope :unreleased, where(:released_at => nil)
end
