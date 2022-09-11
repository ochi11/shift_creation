class Admin::HopeShiftsController < ApplicationController
  
    def index
      @hope_shifts = HopeShift.where(is_active: true) # これで仮確定してないシフト希望を取得
      @shifts = Shift.all
    end
    
    def edit
        @hope_shift = HopeShift.find(params["id"])
    end

    def copy_update #仮登録のシフトを編集する際の記述
#        @hope_shift = HopeShift.find(params["id"])

        shift = Shift.new
        shift.admin_id = current_admin.id
        shift.hope_shift_id = params[:hope_shift_id]
        shift.working_time_start = params[:hope_shift][:working_time_start]
        shift.working_time_end = params[:hope_shift][:working_time_end]
        if params[:hope_shift][:shift].present?
          shift.break_time_start = params[:hope_shift][:shift][:break_time_start] 
          shift.break_time_end = params[:hope_shift][:shift][:break_time_end]
        end
        date = Date.new(params[:hope_shift]["date(1i)"].to_i, params[:hope_shift]["date(2i)"].to_i, params[:hope_shift]["date(3i)"].to_i)
        shift.date = date
#        if @hope_shift.update(hope_shift_params)
       if shift.save
          flash[:success] = "更新に成功しました"
          redirect_to admin_shifts_path
        else
          flash[:warning] = "入力内容を確認してください"
          redirect_to edit_admin_shift_path(params[:hope_shift_id])
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
