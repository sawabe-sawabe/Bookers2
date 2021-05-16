class BooksController < ApplicationController
  
  def index
   @books= Book.all
   @book =Book.new
  
  
  end
  

  def create
   @book= Book.new(post_book_params)
   if @book.user_id= current_user.id
   @book.save
   redirect_to user_path(current_user.id),notice:"Book was successfully created."
   else
     render :index
     
   end
  end

  def show
    @book= Book.find(params[:id])
    @users= User.find(@book.user_id)

  end
  
  def edit
    @book= Book.find(params[:id])
    if @book.user.id == cureent_user
        render :edit
    else
        redirect_to user_path(@book.user.id)
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
    book=Book.destroy
    book.destroy
    redirect_to books_path
  end


private

def post_book_params
  params.require(:book).permit(:title,:body,:user_id)

end

end