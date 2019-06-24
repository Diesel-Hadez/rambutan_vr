json.extract! item_transaction, :id, :borrow_date, :return_date, :user_id, :movie_item_id, :created_at, :updated_at
json.url item_transaction_url(item_transaction, format: :json)
