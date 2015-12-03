class OrdersController < ApplicationController

  def show
    if current_user
      @just_purchased_items = CartedProduct.where("order_id LIKE ?", params[:id])
    else
      redirect_to '/users/sign_up'
    end
  end

  def create
    
    @purchased_items = current_user.carted_products.where("status LIKE ?","carted")

    subtotal_calc = 0
    @purchased_items.each do |item|
      subtotal_calc += item.product.price * item.quantity
    end

    tax_calc = subtotal_calc * Product::SALES_TAX 
    total_calc = tax_calc + subtotal_calc

    @new_order = Order.create(
      user_id: current_user.id,
      total: total_calc,
      tax: tax_calc,
      subtotal: subtotal_calc
      )

    @purchased_items.update_all(status: "purchased", order_id: @new_order.id)

    

    flash[:success] = "Order was successfully created!"

    redirect_to "/orders/#{@new_order.id}"

  end
end
