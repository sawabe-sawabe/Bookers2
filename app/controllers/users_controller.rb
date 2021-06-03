class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :edit, :update, :show]
  before_action :ensure_current_user, { only: [:edit] }
 
  def ensure_current_user
    if current_user.id != params[:id].to_i

      redirect_to user_path(current_user.id)
    end
  end

  def index
    @user = User.all
    @users = User.find(current_user.id)
    @book = Book.new
    @relationship = @users.followings.find_by(follower_id: current_user.id)
  end

  def show
    @users = User.find(params[:id])
    @books = @users.books.reverse_order
    @book = Book.new
    @relationship = @users.followings.find_by(follower_id: current_user.id)
  end
  def followings
    @followings = @users.following_users
  end
    
  def followers
    @followers = @users.follower_users
  end
 
 
  def create
    @book = Book.new(post_book_params)
    if @book.user_id = current_user.id
      if @book.save

        redirect_to book_path(@book.id), notice: "Book was successfully created."
      else
        @books = Book.all
        render :index

      end
    else
      render :index
    end
  end

  def edit
    @users = User.find(params[:id])
  end

  def update
    @users = User.find(params[:id])
    if @users.update(user_params)
      redirect_to user_path(@users.id), notice: "User was successfully updated."
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def post_book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

 

end
