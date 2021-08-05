class Author < ApplicationRecord
  validates :name, :lastname, presence: true
  has_many :books

  enum nationality: [ :english, :french, :italian, :japanese, :american, :spanish, :argentine,
                      :australian, :canadian, :chilean, :german, :russian, :swedish, :british]
end
