class GroupsController < ApplicationController
 def new
   @group = Group.new

 end

  def create
    @group = Group.new(post_group_params)
    @group.owner_id = current_user.id
    @group.users << current_user
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
    @user = User.find(current_user.id)
   @group_users = GroupUser.where(group_id: @group.id)

  
 end
 
  def edit
     @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end

  def update
    @group = Group.find(params[:id])
    @group.update(post_book_params)

  end
  
  def new_mail
    @group = Group.find(params[:group_id])
  end

  def send_mail
    @group = Group.find(params[:group_id])
    group_users = @group.users
    @title = params[:title]
    @content = params[:content]
    GroupMailer.send_mail(group_users, @title, @content).deliver
  end
  private

  
 def post_group_params
    params.require(:group).permit(:name, :image, :introduction)
 end
 
end
