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
  
  def subscribe_to_plan(plan, stripe_card_token)
    customer = Stripe::Customer.retrieve(stripe_customer_token)
    card_fingerprint = Stripe::Token.retrieve(stripe_card_token).try(:card).try(:fingerprint)
    default_card = customer.cards.all.data.select{|card| card.fingerprint == card_fingerprint}.last if card_fingerprint
    default_card = customer.cards.create({:card => stripe_card_token}) unless default_card
    customer.default_card = default_card.id 
    customer.save
    customer.subscriptions.create(:plan => plan)    
  end  
end
