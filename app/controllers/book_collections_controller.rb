class BookCollectionsController < ApplicationController
  before_action :set_book_collection, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :set_books, :set_states, only: %i[ index new edit ]

  # GET /book_collections or /book_collections.json
  def index
    @book_collections = current_user.book_collections.page(params[:page])
    @book_collection = current_user.book_collections.build
    @book_collection_group_states = BookCollection.group(:state).count
    @book_collection_group_genres = BookCollection.books_genres(current_user).transform_keys{ |key| Book.genres.keys[key] }
  end

  # GET /book_collections/1 or /book_collections/1.json
  def show
  end

  # GET /book_collections/new
  def new
    @book_collection = BookCollection.new
  end

  # GET /book_collections/1/edit
  def edit
  end

  # POST /book_collections or /book_collections.json
  def create
    @book_collection = current_user.book_collections.build(book_collection_params)

    respond_to do |format|
      begin
        if @book_collection.save
          format.html { redirect_to book_collection_path, notice: "Book collection was successfully created." }
          format.json { render :show, status: :created, location: @book_collection }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @book_collection.errors, status: :unprocessable_entity }
        end
      rescue ActiveRecord::RecordNotUnique
        format.html { redirect_to @book_collection, status: :unprocessable_entity }
        format.json { render json: @book_collection.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /book_collections/1 or /book_collections/1.json
  def update
    respond_to do |format|
      if @book_collection.update(book_collection_params)
        format.html { redirect_to @book_collection, notice: "Book collection was successfully updated." }
        format.json { render :show, status: :ok, location: @book_collection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_collections/1 or /book_collections/1.json
  def destroy
    @book_collection.destroy
    respond_to do |format|
      format.html { redirect_to book_collections_url, notice: "Book collection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_collection
      @book_collection = BookCollection.find(params[:id])
    end

    def set_books
      @books = Book.pluck(:title, :id)
    end

    def set_states
      @states = BookCollection.states.keys
    end

    # Only allow a list of trusted parameters through.
    def book_collection_params
      params.require(:book_collection).permit(:state, :owned, :book_id)
    end
end
