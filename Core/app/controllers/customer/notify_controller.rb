class Customer::NotifyController < ApplicationController
  def show
		render :json => Series.where(sid: UserFavorit.where(uid: 1).select(:sid) ).select(:sid, :name)
  end
end
