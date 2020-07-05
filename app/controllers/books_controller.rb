class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    @user = User.find_by(id: @book.user_id)
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def new
  	@book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
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
    redirect_to book_path(@book)
  end

  private

  def book_params
      params.require(:book).permit(:title, :body)
  end
  # def user_params
  #     params.require(:user).permit(:name, :Introduction , :profile_image)
  # end
end