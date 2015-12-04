class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  validates :user_id, :subtotal, :tax, :total, presence: true 
  validates :subtotal, :tax, :total, numericality: {greater_than: 0}
  
  def created_formated
    created_at.strftime('%b %e, %l:%M %p')
  end

  def calculate_totals
    subtotal = 0
    carted_products.each do |carted_product|
      subtotal+= carted_product.subtotal
    end

    tax = subtotal * Product::SALES_TAX
    total = subtotal + tax 

  end


end
