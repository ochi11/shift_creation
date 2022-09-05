class Admin::ShiftsController < ApplicationController
    def index
     @hope_shifts = HopeShift.where(is_active: false) # これで仮確定しているシフト希望を取得
     @shift = Shift.new
    end
    
    def edit
     @hope_shift = HopeShift.find(params[:id])
    end
    
    def create
        @shift = shift.new(shift_params)
        if @shift.save
          flash[:success] = "登録に成功しました"
          redirect_to admin_shifts_path(@shift.id)
        else
          flash[:warning] = "入力内容を確認してください"
          render :index
        end
    end
    
    def update
      @shift = shift.find(params[:id])
        if @shift.update(shift_params)
          flash[:success] = "更新に成功しました"
          redirect_to admin_shifts_path
        else
          flash[:warning] = "入力内容を確認してください"
          redirect_to edit_admin_shift_path
        end
    end
    
    def copy_shift
        @hope_shift = HopeShift.find(params["hope_shift_id"])
        @shift = Shift.new()
        @shift.hope_shift_id = @hope_shift.id
        @shift.admin_id = current_admin.id
        @shift.working_time_start = @hope_shift.working_time_start
        @shift.working_time_end = @hope_shift.working_time_end
        @shift.break_time_start = "00:00:00"
        @shift.break_time_end = "00:00:00"
        @shift.date = @hope_shift.date
        
        if @shift.save
          flash[:success] = "登録に成功しました"
          redirect_to admin_shifts_path(@shift.id)
        else
          flash[:warning] = "入力内容を確認してください"
          render :index
        end
    end
    
    private
  def shift_params
    params.require(:shift).permit(:admin_id, :hope_shift_id, :working_time_start, :working_time_end, :noteci_flag, :break_time_start, :break_time_end, :date)
  end
end
