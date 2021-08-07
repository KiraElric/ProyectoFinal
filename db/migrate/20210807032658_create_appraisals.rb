class CreateAppraisals < ActiveRecord::Migration[6.1]
  def change
    create_table :appraisals do |t|
      t.text :review, null: false
      t.integer :score, default: 0
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
