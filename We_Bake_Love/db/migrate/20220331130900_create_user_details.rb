class CreateUserDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :user_details do |t|
      t.string :phone
      t.string :address
      t.integer :user_id
      t.integer :total
      t.string :cake_name
      t.string :quantity
      t.integer :price
      t.string :status, default: "pending"
      t.timestamps
    end
  end
end
