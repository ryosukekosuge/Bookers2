class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
    @new = Book.new
    @books = Book.where(user_id: @user.id)
  end

  def edit
  	@user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
    @new = Book.new
  end

  def update
 	  @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:update] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end
 private
  def user_params
      params.require(:user).permit(:name, :introduction , :profile_image)
  end
end
