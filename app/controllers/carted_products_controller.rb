class CartedProductsController < ApplicationController

  def create
    @carted_products = CartedProduct.create(
      user_id: current_user.id,
      quantity: params[:input_quantity],
      product_id: params[:input_product_id],
      status: "carted"
    )
    redirect_to '/carted_products'
  end

   def index
    if current_user
      @cart_items = current_user.carted_products.where("status LIKE ?","carted")
    else
      redirect_to '/users/sign_up'
    end
  end

end
