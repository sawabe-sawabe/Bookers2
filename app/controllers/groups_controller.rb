class GroupsController < ApplicationController
 def new
   @group = Group.new

 end

  def create
    @group = Group.new(post_group_params)
    @group.owner_id = current_user.id
    @group.save
     redirect_to groups_path
  end

 def index
   @groups = Group.all
   @book = Book.new
   @user = User.find(current_user.id)
   @users = User.all
 end

 def  show
    @book = Book.new
    @group = Group.find(params[:id])
    @users = User.find(@group.user_id)
 end
 
  def edit
     @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to 
    end
  end

  def update
    @group = Group.find(params[:id])
    @group.update(post_book_params)

  end
  private

  def post_book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
 def post_group_params
    params.require(:group).permit(:name, :image, :introduction)
 end
 
end
