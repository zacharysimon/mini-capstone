class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :email
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
