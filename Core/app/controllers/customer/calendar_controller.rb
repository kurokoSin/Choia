class Customer::CalendarController < ApplicationController
	def get_list
    day_begin  = params[:begindate].to_date
    day_end    = params[:enddate].nil? ? params[:begindate].to_date : params[:enddate].to_date
    uid        = params[:id].nil? ? -1 : params[:id].to_i 

    json = UserFavorit.GetSaleList(day_begin, day_end, uid)

    render :json => json
  end
end
