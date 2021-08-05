class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.bigint :isbn, null: false
      t.integer :language, default: 0
      t.integer :genre, default: 0
      t.text :description
      t.belongs_to :author, null: false, foreign_key: true
      t.belongs_to :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
