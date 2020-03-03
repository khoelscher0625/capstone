class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.paginate(page: params[:page], per_page: 20) 
  end

  def show
    @books = Book.all
  end

  def new
    @books = Book.new
  end

end

