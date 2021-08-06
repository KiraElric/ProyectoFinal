class BookCollection < ApplicationRecord
  belongs_to :book
  belongs_to :user

  enum state: [ :want_to_read, :reading, :read, :trade ]
end
