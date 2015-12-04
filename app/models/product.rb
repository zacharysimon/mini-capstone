class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images

  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :carted_products
  has_many :orders, through: :carted_products

  validates :name, :price, presence: true 
  validates :price, numericality: true 

  SALES_TAX = 0.09

  def sale_message
    if price.to_i < 2 
      return "Discount Item!"
    else
      return "On sale!"
    end
  end 

  def calculate_tax
    price * SALES_TAX
  end

  def total_price
    price + calculate_tax

  end


end
