class CreateItemTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :item_transactions do |t|
      t.datetime :borrow_date
      t.datetime :return_date
      t.integer :user_id
      t.integer :movie_item_id

      t.timestamps
    end
  end
end
