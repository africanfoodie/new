class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
  end

 def create
  # raise 'a'
  @subscription = Subscription.new(params[:subscription].permit(:stripe_card_token))
  if @subscription.save_with_payment(params[:plan]) #(current_user)
    redirect_to @subscription, :notice => "Thank you for subscribing!"
  else
    render :new
  end
end

  def destroy
  end

  def show
  end
end
