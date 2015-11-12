class ProductsController < ApplicationController

  def home
  end

  def storefront
    @products = Product.all 
  end

  def sixetywatt

  end

  def fourtywatt

  end

end
