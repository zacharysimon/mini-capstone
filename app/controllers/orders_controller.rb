class OrdersController < ApplicationController

  def show
    if current_user
      @cart_items = current_user.carted_products
      @user = current_user.email
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

    tax_calc = subtotal_calc * 0.09
    total_calc = tax_calc + subtotal_calc

    @new_order = Order.create(
      user_id: current_user.id,
      total: total_calc,
      tax: tax_calc,
      subtotal: subtotal_calc
      )

    @purchased_items.each do |item|
      item.update(status: "purchased", order_id: @new_order.id)
    end

    redirect_to '/orders'
  end
end
