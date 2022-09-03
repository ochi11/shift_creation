class Admin::HopeShiftsController < ApplicationController
    
    def edit
        @hope_shift = HopeShift.find(params["id"])
    end

    def update
        @hope_shift = HopeShift.find(params["id"])
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
end
