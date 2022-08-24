class Public::HopeShiftsController < ApplicationController
  def index
   @events = HopeShift.all
   @hope_shift = HopeShift.last
  end

  def new
   @hope_shift = HopeShift.new
  end

  def confirm

  end

  def complete

  end

  def update

  end

  def create
    @hope_shift = HopeShift.new(hope_shift_params)
    @hope_shift.end_user_id = current_end_user.id
    @hope_shift.save
    redirect_to new_public_hope_shift_path
  end

  def destroy

  end
      private



  def hope_shift_params
  		params.require(:hope_shift).permit(:shift_id, :end_user_id, :date, :working_time_start, :working_time_end, :start_date, :end_date, :is_active)
  end
end
