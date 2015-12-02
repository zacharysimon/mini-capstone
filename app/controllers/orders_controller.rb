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
  
  end
end
