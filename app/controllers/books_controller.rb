class BooksController < ApplicationController
  before_action :authenticate_user! 
  before_action :confirm_admin_status, only: [:new]
  
  def index
    @books = Book.paginate(page: params[:page], per_page: 20) 
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.book.create(book_params)
      if @book.valid?
        redirect_to root_path
      else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])

    if @book.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end

  def update
     @book = Book.find(params[:id])
    if @book.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @book.update_attributes(place_params)
    if @book.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

   def destroy
    @book = Book.find(params[:id])
    if @book.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @book.destroy
    redirect_to root_path
  end

  private

  def confirm_admin_status
    if current_user.admin == false
      redirect_to root_path
    end
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :level)
  end

end

