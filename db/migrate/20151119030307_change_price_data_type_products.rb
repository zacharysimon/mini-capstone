class ChangePriceDataTypeProducts < ActiveRecord::Migration
  def change
    change_column :products, :price, :decimal, :precision => 7, :scale => 5  
  end
end
