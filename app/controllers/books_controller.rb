class BooksController < ApplicationController
  before_action :authenticate_user!

  def show
    @book = Book.find(params[:id])
    @new = Book.new
  end

  def index
    @book = Book.new
    @new = Book.new
    @books = Book.all
    @user = current_user
  end

  def new
  	@book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
      redirect_to books_path
    end
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
     flash[:notice] = "You have creatad book successfully."
     redirect_to book_path(@book)
    else
     @books = Book.all
     @user = current_user
     render 'index'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book)
   else
    render 'edit'
   end
  end

  private

  def book_params
      params.require(:book).permit(:title, :body)
  end
  # def user_params
  #     params.require(:user).permit(:name, :Introduction , :profile_image)
  # end
end