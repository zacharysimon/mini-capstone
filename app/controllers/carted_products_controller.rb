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
      flash[:warning] = "Sign in to add this to your cart!"
    end
  end

  def index

   if current_user
      @cart_items = current_user.carted_products.where("status LIKE ?","carted")

      if @cart_items.length == 0
        redirect_to '/products'
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


  flash[:success] = "Product was successfully removed from cart!"
  redirect_to "/carted_products"

  end

end
