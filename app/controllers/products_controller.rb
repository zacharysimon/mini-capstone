class ProductsController < ApplicationController

  def home
  end

  def index
    sort_attribute = params[:input_sort]
    sort_order = params[:input_sort_order]
    discount = params[:input_param]
    search = params[:search]

    if sort_attribute && sort_order
      @products = Product.order(sort_attribute => sort_order)
    elsif discount
      @products = Product.where("price < ?", 2)
    elsif search
      @products = Product.where("name LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
    else
      @products = Product.all
    end

  end

  def show 
    if current_user
      if params[:id] == "random"
        product_id = [rand(1..Product.count)]
        @product = Product.find_by(id: product_id)
      elsif
        @product = Product.find_by(id: params[:id])
      end
    else
        redirect_to '/users/sign_in'
    end
  end

  def new
  end

  def create
    @new_product = Product.create(
      name: params[:input_name],
      price: params[:input_price],
      description: params[:input_description],
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
