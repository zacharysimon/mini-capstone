class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products
  
  def created_formated
    created_at.strftime('%b %e, %l:%M %p')
  end

end
