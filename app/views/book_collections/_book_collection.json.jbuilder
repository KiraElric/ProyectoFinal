json.extract! book_collection, :id, :state, :owned, :book_id, :user_id, :created_at, :updated_at
json.url book_collection_url(book_collection, format: :json)
