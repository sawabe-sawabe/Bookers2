class GroupUsersController < ApplicationController

 def create
    @group = Group.find(params[:group_id])
    group_user_join = current_user.group_users.new(group_id: @group.id)
    group_user_join.save
    redirect_to groups_path
 end

  def destroy
     @group = Group.find(params[:group_id])
     group_user_join = current_user.group_users.find_by(group_id: @group.id)
     group_user_join.destroy
     redirect_to groups_path
  
  end

 


end
