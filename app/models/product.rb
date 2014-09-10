class Product < ActiveRecord::Base

  mount_uploader :image, ImageUploader
  has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg"


  validates :title, :description, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
 

  belongs_to :user
  has_many :orders
  # scope :unreleased, where(:released_at => nil)
   attr_accessor :stripe_card_token
 
def save_with_payment
  if valid?
    customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
    self.stripe_customer_token = customer.id
    save!
  end
  
 
   # Handle exceptions
   rescue Stripe::APIError => e
      logger.error "Stripe Authentication error while creating user: #{e.message}"
      errors.add :base, "Our system is temporarily unable to process credit cards."
      false
end


def cancel_subscription_plan
customer = Stripe::Customer.retrieve(stripe_customer_token)
customer.cancel_subscription()
user.update_attributes(:payment_status => false)
true
# Handle exception
end
end
