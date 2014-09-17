class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
  end

 def create
  # raise 'a'
  @subscription = Subscription.new(params[:subscription].permit(:stripe_card_token))
  @subscription.user = current_user
  if @subscription.save_with_payment(params[:plan]) #(current_user)
    redirect_to @subscription, :notice => "Thank you for subscribing!"
  else
    render :new
  end
end

  def destroy
  end

  def show
    customer_token = current_user.subscription.try(:stripe_customer_token)
    @charges = customer_token ? Stripe::Charge.all(customer: customer_token) : []
    @cards =  customer_token ? Stripe::Customer.retrieve(customer_token).cards : []
  end
end
