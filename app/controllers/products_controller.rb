class ProductsController < ApplicationController

  def home
  end

  def index
    @products = Product.all 
  end

  def show 
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
  end

  def new
  end

  def create
    @new_product = Product.create(
      name: params[:input_name],
      price: params[:input_price],
      description: params[:input_description],
      image: params[:input_image]
    )
    redirect_to '/products'
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
   @product = Product.find_by(id: params[:id])
   @product.update(
    name: params[:input_name],
    price: params[:input_price],
    description: params[:input_description],
    image: params[:input_image]
    )
  flash[:success] = "Product was successfully updated!"
  redirect_to "/products/#{@product.id}"
  end

  def destroy
    @products = Product.all
    @product_to_delete = Product.find_by(id: params[:id])
    @product_to_delete.delete


    flash[:success] = "Product was successfully deleted!"
    redirect_to '/products'
  end 



end
