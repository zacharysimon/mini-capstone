class AddSuppliertoUsers < ActiveRecord::Migration
  def change
    add_column :users, :supplier, :boolean
  end
end
