class UsersController < ApplicationController
  
  def index
    @usersindex=User.all
    @users=User.find(current_user.id)
    @book=Book.new
  end
  
  def show
    @users=User.find(params[:id])
    @books=@users.book
    @book=Book.new
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
  

    def edit
    @users=User.find(params[:id])
    
    if @users.id == current_user.id
      render 'edit'
    else
      redirect_to user_path(@user.id)
    end  
    end  

  def update
    @users=User.find(params[:id])
    if @users.update(user_params)
    redirect_to user_path(users.id),notice:"User was successfully updated."
    else
     render 'edit'
    end
  end  

private

 def user_params
   params.require(:user).permit(:name,:profile_image,:introduction)
   
 end
 
 def post_book_params
  params.require(:book).permit(:title,:body,:user_id)

 end

end