class AppraisalsController < ApplicationController
  before_action :set_appraisal, only: %i[ show edit update destroy ]
  before_action :set_score, only: %i[ new edit ]
  before_action :authenticate_user!
  before_action :set_book

  # GET /appraisals or /appraisals.json
  def index
    @appraisals = @book.appraisals
  end

  # GET /appraisals/1 or /appraisals/1.json
  def show
  end

  # GET /appraisals/new
  def new
    @appraisal = @book.appraisals.build
  end

  # GET /appraisals/1/edit
  def edit
  end

  # POST /appraisals or /appraisals.json
  def create
    @appraisal = @book.appraisals.build(appraisal_params.merge(user: current_user))

    respond_to do |format|
      if @appraisal.save
        format.html { redirect_to [@book, @appraisal], notice: "Appraisal was successfully created." }
        format.json { render :show, status: :created, location: @appraisal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appraisal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appraisals/1 or /appraisals/1.json
  def update
    respond_to do |format|
      if @appraisal.update(appraisal_params.merge(user: current_user, book: @book))
        format.html { redirect_to [@book, @appraisal], notice: "Appraisal was successfully updated." }
        format.json { render :show, status: :ok, location: @appraisal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appraisal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appraisals/1 or /appraisals/1.json
  def destroy
    @appraisal.destroy
    respond_to do |format|
      format.html { redirect_to [@book, @appraisal], notice: "Appraisal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appraisal
      @appraisal = Appraisal.find(params[:id])
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    def set_score
      @scores = Appraisal.scores.keys
    end

    # Only allow a list of trusted parameters through.
    def appraisal_params
      params.require(:appraisal).permit(:review, :score)
    end
end
