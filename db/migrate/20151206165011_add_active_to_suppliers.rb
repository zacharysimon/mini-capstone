class AddActiveToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :active, :boolean
  end
end
