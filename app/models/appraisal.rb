class Appraisal < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :review, presence: true

  enum score: [ :bored, :regular, :good, :exciting, :master_piece]
end
