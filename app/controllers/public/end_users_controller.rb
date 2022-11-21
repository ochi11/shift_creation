class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!, except: [:top]
  
  def index
    @end_user = current_end_user
    # ログインしているユーザーのshift情報をすべて取得
    @allShifts = current_end_user.hope_shifts
    # お知らせフラグをfalse
    @noticeFlag = false
    # ログインしているユーザのシフト情報の中に、お知らせフラグがFalseのものがあったら
    # お知らせフラグをTrueにする
    @allShifts.each do |hope_shift|
      @shifts = hope_shift.shifts
      if @shifts.any? {|shift| !shift.notice_flag }
        @noticeFlag = true
      end
    end
  end

  def show
    allShifts = current_end_user.hope_shifts
    allShifts.each do |hope_shift|
      shifts = hope_shift.shifts
      shifts.update(notice_flag: true)
    end
  end
  
  def edit 
    @end_user = current_end_user
  end
  
  def update
    #byebug
    @end_user = current_end_user
    
    if @end_user.update(end_user_params)
       flash[:success] =  "更新に成功しました"
       redirect_to end_users_path(current_end_user)
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
