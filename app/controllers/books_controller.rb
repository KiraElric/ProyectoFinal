class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :set_genres, :set_languages, :set_publishers, only: %i[ index new edit ]
  before_action :set_authors, only: %i[ index new edit ]
  before_action :authenticate_user!

  # GET /books or /books.json
  def index
    @books = Book.all.page(params[:page])
    @book = Book.new
  end

  # GET /books/1 or /books/1.json
  def show
    respond_to do |format|
      format.js
    end
  end

  # GET /books/new
  def new
      @book = Book.new
  end

  # GET /books/1/edit
  def edit
      respond_to do |format|
        format.js
      end
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def set_genres 
      @genres = Book.genres.keys
    end

    def set_languages  
      @languages = Book.languages.keys 
    end

    def set_publishers
      @publishers = Publisher.pluck(:name, :id)
    end

    def set_authors
      @authors = Author.pluck(:name, :lastname,:id).map{ |author| ["#{author[0]} #{author[1]}", author[2]]  }
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :isbn, :language, :genre, :description, :author_id, :publisher_id)
    end
end
