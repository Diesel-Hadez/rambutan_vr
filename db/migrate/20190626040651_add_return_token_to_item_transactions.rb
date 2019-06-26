class AddReturnTokenToItemTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :item_transactions, :return_token, :string
    add_column :item_transactions, :pickup_token, :string
  end
end
