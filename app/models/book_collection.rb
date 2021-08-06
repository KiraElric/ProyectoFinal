class BookCollection < ApplicationRecord
  belongs_to :book
  belongs_to :user

  paginates_per 25

  enum state: [ :want_to_read, :reading, :read, :trade ]

  def book_title
    self.book.title
  end

  def book_author
    self.book.authors_name
  end

  def book_publisher
    self.book.publisher.name
  end

  def book_genre
    self.book.genre
  end
end
