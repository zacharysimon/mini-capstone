class OrdersController < ApplicationController

  def show
    if current_user
      @order = Order.last 
      @user = current_user.email
    else
      redirect_to '/users/sign_up'
    end
  end

  def create
    @new_order = Order.create(
      user_id: current_user.id,
      quantity: params[:input_quantity],
      product_id: params[:input_product_id],
      subtotal: Product.find_by(id: params[:input_product_id]).price,
      tax: Product.find_by(id: params[:input_product_id]).calculate_tax,
      total: Product.find_by(id: params[:input_product_id]).total_price,
    
    )
    redirect_to '/orders'
  end
end
