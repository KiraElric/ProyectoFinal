class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @books = Book.all.page(params[:page])
  end
end
