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
    elsif params[:category]
      @products = Category.find_by(name: params[:category]).products 
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
    unless current_user && current_user.admin
      redirect_to '/'
    else
      @product = Product.new 
    end
  end

  def create
    @product = Product.new(
      name: params[:input_name],
      price: params[:input_price],
      description: params[:input_description],
      )
    if @product.save 
      flash[:success] = "Product successfully created!"
      redirect_to '/products'
    else
      render :new
    end

  end

  def edit
    if current_user && current_user.admin 
      @product = Product.find_by(id: params[:id])
    else
      redirect_to '/'
    end
  end

  def update
    if current_user && current_user.admin
     @product = Product.find_by(id: params[:id])
     if @product.update(
        name: params[:input_name],
        price: params[:input_price],
        description: params[:input_description],
        )
       flash[:success] = "Product was successfully updated!"
       redirect_to "/products/#{@product.id}"
     else
      render :edit 
    end
  end
end

def destroy
  @products = Product.all
  @product_to_delete = Product.find_by(id: params[:id])
  @product_to_delete.delete


  flash[:success] = "Product was successfully deleted!"
  redirect_to '/products'
end 

end
