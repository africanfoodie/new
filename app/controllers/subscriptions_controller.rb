class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
  end

 def create
  # raise 'a'
    if current_user.subscription.present?
      success = current_user.subscription.subscribe_to_plan(params[:plan], subscription_params[:stripe_card_token])
    else
     @subscription =  Subscription.new(subscription_params)
     @subscription.user = current_user
     success = @subscription.save_with_payment(params[:plan])   
    end
    
    if success
      redirect_to '/subscriptions/payments', :notice => "Thank you for subscribing!"
    else
      render :new
    end
  end

  def destroy
  end

  def payments
    customer_token = current_user.subscription.try(:stripe_customer_token)
    @charges = customer_token ? Stripe::Charge.all(customer: customer_token) : []
  end

  def cards
    customer_token = current_user.subscription.try(:stripe_customer_token)
    @cards =  customer_token ? Stripe::Customer.retrieve(customer_token).cards : []
  end
  private
  def subscription_params
    params[:subscription].permit(:stripe_card_token)
  end
# def cancel_subscription_plan
# customer = Stripe::Customer.retrieve(stripe_customer_token)
# customer.cancel_subscription()
# user.update_attributes(:payment_status => false)
# true
# (handle exception)
end