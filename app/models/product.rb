class Product < ActiveRecord::Base

  def sale_message
    if price.to_i < 2 
      return "Discount Item!"
    else
      return "On sale!"
    end
  end 

  def calculate_tax
    (price.to_f * 0.1).to_f
  end

  def total_price
    price.to_f + calculate_tax

  end

end
