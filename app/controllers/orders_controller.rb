class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def sales
    @orders = Order.all.where(seller: current_user).order("Created_at DESC")
  end

  # GET /orders/new
  def new
    @order = Order.new
    @product = Product.find(params[:product_id])
  end



# def create
 
#     Stripe.api_key = ENV["STRIPE_API_KEY"]
 
#     customer = Stripe::Customer.create(
#       :description => current_user.email,
#       # :plan  => params[:charges][:plan_type],
#       :card  => params[:stripeToken],
#       :customer => params[:customer]
#     )
 
#     Stripe::Charge.create(
#       :amount => 97*100, # incents 
#       :currency => "usd",
#       :customer => customer.id
# )
    
#     if !customer.default_card.nil?
#       flash[:notice] = "Charge went well"
#       current_user.active_subscription = true
#       current_user.update_attribute(:customer_id, customer.id)
#       current_user.save
#       redirect_to pages_dashboard_path
#     end
 
#     rescue Stripe::CardError => e
#       flash[:error] = e.message
#       redirect_to charges_path
 
#   end

  # # POST /orders
  # # POST /orders.json
  def create
    @order = Order.new(order_params)
    @product = Product.find(params[:product_id])
    @seller = @product.user

    @order.product_id = @product.id
    @order.buyer_id = current_user.id
    @order.seller_id = @seller.id

    Stripe.api_key = ENV["STRIPE_API_KEY"]
    token = params[:stripeToken]

    begin
      Stripe::Charge.create(
        :card => token, 
        :plan => "mixy",
        :email => "payinguser@example.com"
        )

      # charge = Stripe::Charge.create(
      #  :amount => (@product.price * 100).floor,
      #  :currency => "gbp",
      #  :card => token
      #  )

      flash[:notice] = "Thanks for ordering!"

    rescue Stripe::CardError => e
      flash[:danger] = e.message
    end
    
    respond_to do |format|
      if @order.save
        format.html { redirect_to root_url }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
   end
 


  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  # def update
  #   respond_to do |format|
  #     if @order.update(order_params)
  #       format.html { redirect_to @order, notice: 'Order was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @order }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /orders/1
  # DELETE /orders/1.json
  # def destroy
  #   @order.destroy
  #   respond_to do |format|
  #     format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:address, :city, :county)
    end

end
