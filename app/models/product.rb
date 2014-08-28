class Product < ActiveRecord::Base

  validates :title, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
 

  belongs_to :user
end
