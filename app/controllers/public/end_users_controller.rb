class Public::EndUsersController < ApplicationController
  def index
   @end_user = EndUser.find(current_end_user.id)
  end

  def show

  end
  
  def edit 
    @end_user = EndUser.find(current_end_user.id)
  end
  
  def update
    @end_user = EndUser.find(current_end_user.id)
    if @end_user.update(end_user_params)
       flash[:success] =  "更新に成功しました"
       redirect_to public_end_users_path(current_end_user)
    else
       flash[:warning] = "入力内容を確認してください"
       render :edit
    end
  end
    private



  def end_user_params
  		params.require(:end_user).permit(:name, :email, :is_deleted)
  end
end
