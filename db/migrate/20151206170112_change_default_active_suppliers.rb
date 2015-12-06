class ChangeDefaultActiveSuppliers < ActiveRecord::Migration
  def change
    change_column :users, :supplier, :boolean, default: false 
    change_column :suppliers, :active, :boolean, default: true 
  end
end
