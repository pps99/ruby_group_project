class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :quantity
      t.integer :cake_id
      t.string  :cake_name
      t.integer :cart_id
      t.decimal :total
      t.decimal :unit_price

      t.timestamps
    end
  end
end
