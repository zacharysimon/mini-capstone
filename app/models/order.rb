class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  
  def created_formated
    created_at.strftime('%b %e, %l:%M %p')
  end

end
