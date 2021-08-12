class BookCollection < ApplicationRecord
  belongs_to :book
  belongs_to :user

  before_save :owned_book

  scope :books_genres, ->(current_user) { joins(:book, :user).select('books.genre', 'book_collections.id', 'books.title').where("user_id=?", current_user.id).group('books.genre').count('book_collections.id') }
  scope :user_book, ->(current_user) {where("user_id=?", current_user.id )}

  paginates_per 25

  enum state: [ :want_to_read, :reading, :read, :exchanged ]

  def owned_book
    if self.state == :exchanged
      self.owned = false
    end
  end

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

  def book_description
    self.book.description
  end
end
