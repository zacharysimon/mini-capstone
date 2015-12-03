class CartedProductsController < ApplicationController

  def create
    if current_user
      @carted_products = CartedProduct.create(
        user_id: current_user.id,
        quantity: params[:input_quantity],
        product_id: params[:input_product_id],
        status: "carted"
      )
      redirect_to '/carted_products'
    else
      redirect_to '/products'
      flash[:info] = "Sign in to add this to your cart!"
    end
  end

  def index

   if current_user
      @cart_items = current_user.carted_products.where(status: "carted")

      if !@cart_items.any? #.any? is the same as .length == 0 but more readable
        redirect_to '/products'
        flash[:info] = "You got nothin' in yo cart. Add some bulbs!"
      end 
    else
        redirect_to '/products'
    end 

  end

  def update
   @cart_item = CartedProduct.find_by(id: params[:id])

   @cart_item.update(
    status: "removed"
    )


  flash[:warning] = "Product was successfully removed from cart!"
  redirect_to "/carted_products"

  end

end
