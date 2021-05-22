class SeriesController < ApplicationController
  def show
    render :json => Series.all.select(:sid, :name)
  end
end
