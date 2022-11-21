class Public::ShiftsController < ApplicationController
  before_action :authenticate_end_user!, except: [:top]
  
  def index

  end
  
  #def show
    #Shift.find(params[:id]).update(notice_flag: true)
  #end
end
