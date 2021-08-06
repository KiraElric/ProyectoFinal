class AddIndexToBookCollections < ActiveRecord::Migration[6.1]
  def change
    add_index :book_collections, [ :book_id, :user_id ], unique: true
  end
end
