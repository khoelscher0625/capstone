class BooksController < ApplicationController
  before_action :authenticate_user! 
  before_action :confirm_admin_status, only: [:new]
  
  def index
    @books = Book.paginate(page: params[:page], per_page: 20) 
  end

  def new
    @book = Book.new
  end

  private

  def confirm_admin_status
    if current_user.admin == false
      redirect_to root_page
    end
  end
end

