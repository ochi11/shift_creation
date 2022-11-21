class Public::HopeShiftsController < ApplicationController
  def index
   @events = [*HopeShift.all, *Shift.all]
  # @events = [*HopeShift.last(1), *Shift.last(1)]

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
    if @hope_shift.save
      redirect_to new_hope_shift_path
    else
      render :new
    end
  end

  def destroy

  end
      private



  def hope_shift_params
  		params.require(:hope_shift).permit(:shift_id, :end_user_id, :date, :working_time_start, :working_time_end, :start_date, :end_date, :is_active)
  end
end
