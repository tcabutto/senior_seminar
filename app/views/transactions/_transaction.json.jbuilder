json.extract! transaction, :id, :popularity_given, :transaction_date, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
