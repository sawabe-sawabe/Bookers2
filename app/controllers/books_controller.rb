class BooksController < ApplicationController
  
  def index
   @books= Book.all
   @book =Book.new
  end

  def create
   @book= Book.new(post_book_params)
   @book.user_id= current_user.id
   @book.save
   redirect_to book_path(@book.id)
  
  end

  def show
    @book= Book.find(params[:id])

  end
  
  def edit
    @book= Book.find(params[:id])
  end  
  
  def update
    book=Book.find(params[:id])
    book.update(post_book_params)
    redirect_to book_path(book.id)
  end   
  def destroy
    book=Book.destroy
    book.destroy
    redirect_to books_path
  end
end

private

def post_book_params
  params.require(:book).permit(:title,:body,:user_id)

end