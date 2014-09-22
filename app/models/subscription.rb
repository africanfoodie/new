class Subscription < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id #it should be always compulsary
  # attr_accessible :plan

  attr_accessor :stripe_card_token

  def save_with_payment(plan)
      customer = Stripe::Customer.create(description: 'subscription', plan: plan, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    
  end
  end
