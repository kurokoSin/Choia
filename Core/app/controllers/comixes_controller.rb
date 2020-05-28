require "lib_han_zen.rb"

class ComixesController < ApplicationController
  before_action :set_comix, only: [:show, :update, :destroy]

  # GET /comixes
  def index
    @comixes = Comix.all

    render json: @comixes
  end

  # GET /comixes/1
  def show
    render json: @comix
  end

  # POST /comixes
  def create
    @find = Comix.find_by( name: narrow_to_wide(params[:name]), publish_date: params[:publish_date] )
    unless @find
      # @comix = Comix.new(comix_params)
      @comix = Comix.new(name: narrow_to_wide(params[:name]), 
                         publisher: params[:publisher], 
                         comic_name: params[:comic_name], 
                         is_adult: params[:is_adult], 
                         book_name: params[:book_name], 
                         author: params[:author], 
                         publish_date: params[:publish_date]
               )
    end

    if @comix.save
      render json: @comix, status: :created, location: @comix
    else
      render json: @comix.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comixes/1
  def update
    if @comix.update(comix_params)
      render json: @comix
    else
      render json: @comix.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comixes/1
  def destroy
    @comix.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comix
      # @comix = Comix.find(params[:id])
      # like_top = ActiveRecord::Base.connection.concat('topics.name', '%')
      @comix = Comix
                 .select(
                   :id, 
                   :name, 
                   :author, 
                   :publisher, 
                   "case 
                     when exists( select 1 
                                    from topics 
                                   where comixes.name like #{concat('topics.name', "'%'")} ) then 1
                     when exists( select 1 
                                    from series_aliases 
                                   where comixes.name like #{concat('series_aliases.aname', "'%'")} ) then 1
                     else 0 END as fav "
                   )
                 .where(
                   publish_date: params[:id], 
                   is_adult: :false
                   )
                 .order(fav: "DESC", name: "ASC")
                 # .order(fav: "DESC", publisher: "ASC")
    end

    # Only allow a trusted parameter "white list" through.
    def comix_params
      params.fetch(:comix, {})
    end

    private
    def concat(*args)
      ActiveRecord::Base.connection.concat(args)
    end
end
