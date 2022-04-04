class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :users_detail_id
      t.string :status
      t.integer :total
      t.timestamps
    end
  end
end
