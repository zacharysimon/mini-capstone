class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
      t.decimal :subtotal, :precision => 7, :scale => 5
      t.decimal :tax, :precision => 7, :scale => 5
      t.decimal :total, :precision => 7, :scale => 5

      t.timestamps null: false
    end
  end
end
