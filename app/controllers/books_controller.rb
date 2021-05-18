class BooksController < ApplicationController
  before_action :authenticate_user!, only:[:index,:create,:edit,:update,:show]

 
  
  def index
   @books= Book.all
   @book =Book.new
   @user= User.find(current_user.id)
   @users=User.all
  
  end
  

  def create
      
   @book= Book.new(post_book_params)
   @book.user_id= current_user.id 
      if@book.save
  
       redirect_to book_path(@book.id),notice:"Book was successfully created."
       else
         @books=Book.all
         render :index
      end
  end

  def show
    @book=Book.new
    @books= Book.find(params[:id])
    @users= User.find(@books.user_id)

  end
  
  def edit
    @book= Book.find(params[:id])
    unless @book.user == current_user
      redirect_to  books_path
    end
      
  end  
  
  def update
   @book=Book.find(params[:id])
   if @book.update(post_book_params)
    redirect_to book_path(@book.id),notice:"Book was successfully updated."
   else
     render :edit
     
   end
  end   
  def destroy
  
   book=Book.find(params[:id])
   book.destroy
    redirect_to books_path
  end


private

def post_book_params
  params.require(:book).permit(:title,:body)
end

def user_params
   params.require(:user).permit(:name,:profile_image,:introduction)
   
end

end