class Product < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg"


  validates :title, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
 

  belongs_to :user
end
