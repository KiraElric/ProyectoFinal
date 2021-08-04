class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name, null: false
      t.string :lastname, null: false
      t.integer :nationality, default: 0

      t.timestamps
    end
  end
end
