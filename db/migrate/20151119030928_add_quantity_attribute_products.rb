class AddQuantityAttributeProducts < ActiveRecord::Migration
  def change
    add_column :products, :quantity_available, :integer
  end
end
