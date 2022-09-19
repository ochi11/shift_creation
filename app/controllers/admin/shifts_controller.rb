class Admin::ShiftsController < ApplicationController
    def index
     @hope_shifts = HopeShift.where(is_active: false).where(is_registered: false) # これで仮確定しているシフト希望を取得
     @shift = Shift.new
     @hope_shifts.each do |hope_shift|
       @hope_shift_working_time_start = hope_shift.working_time_start
       @hope_shift_working_time_end = hope_shift.working_time_end
       @hope_shift_date = hope_shift.date
     end
    end
    
    def show
     
    end
    
    def edit
     @shift = Shift.find(params[:id])
    end
    
    def create
        @shift = Shift.new(shift_params)
        @shift.admin_id = current_admin.id
        
        if @shift.save
          hope_shift = HopeShift.find(@shift.hope_shift_id) 
          hope_shift.update(is_registered: true) # 確定したシフトの作成
          flash[:success] = "登録に成功しました"
          redirect_to confirmed_shift_admin_shifts_path(@shift.id)
        else
          flash[:warning] = "入力内容を確認してください"
          redirect_to admin_shifts_path(@shift.id)
        end
    end
    
    def update
      @shift = Shift.find(params[:id])
        if @shift.update(shift_params)
          flash[:success] = "更新に成功しました"
          redirect_to confirmed_shift_admin_shifts_path
        else
          flash[:warning] = "入力内容を確認してください"
          redirect_to edit_admin_shift_path(@shift.id)
        end
    end
    
    def registered #いらない？
      @hope_shift = HopeShift.find(params["hope_shift_id"])
      @hope_shift.is_registered = true # 確定
      
      if @hope_shift.update(is_registered: true)
        flash[:success] = "更新に成功しました"
        redirect_to confirmed_shift_admin_shifts_path
      else
        flash[:warning] = "入力内容を確認してください"
        redirect_to admin_shifts_path
      end
    end
    
    def confirmed_shift
      @shifts = Shift.all # これで確定しているシフトを取得
       @shifts.each do |shift|
         @shift_working_time_start = shift.working_time_start
         @shift_working_time_end = shift.working_time_end
         @shift_date = shift.date
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
    
    def destroy # 確定シフトの削除
      @shift = Shift.find(params["id"])
      @shift.destroy
      redirect_to confirmed_shift_admin_shifts_path
    end
    
    private
  def shift_params
    params.require(:shift).permit(:admin_id, :hope_shift_id, :working_time_start, :working_time_end, :noteci_flag, :break_time_start, :break_time_end, :date)
  end
end
