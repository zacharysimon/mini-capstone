class CartedProduct < ActiveRecord::Base

  belongs_to :product 
  belongs_to :order
  belongs_to :user 


  def subtotal
    quantity * product.price
  end


end
