class Admin::HopeShiftsController < ApplicationController
  
    def index
      @hope_shifts = HopeShift.where(is_active: true) # これで仮確定してないシフト希望を取得
      @shifts = Shift.all
    end
    
    def edit
        @hope_shift = HopeShift.find(params["id"])
    end

    def update
        @hope_shift = HopeShift.find(params["id"])
        if @hope_shift.update(hope_shift_params)
          flash[:success] = "更新に成功しました"
          redirect_to admin_hope_shifts_path
        else
          flash[:warning] = "入力内容を確認してください"
          redirect_to edit_admin_hope_shift_path
        end
    end
    
    def active
        @hope_shift = HopeShift.find(params["hope_shift_id"])
        @hope_shift.is_active = false # 仮確定
        
        if @hope_shift.save
          flash[:success] = "登録に成功しました"
          redirect_to admin_shifts_path
        else
          flash[:warning] = "入力内容を確認してください"
          redirect_to admin_shifts_path
        end 
    end
    
    def destroy
        @hope_shift = HopeShift.find(params["id"])
        @hope_shift.destroy
        redirect_to admin_shifts_path
    end
    
        private
    def hope_shift_params
      params.require(:hope_shift).permit(:end_user_id, :working_time_start, :working_time_end, :is_active, :date)
    end
end
