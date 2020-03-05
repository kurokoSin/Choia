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
    # @comix = Comix.new(comix_params)
    @comix = Comix.new(name: params[:name], publisher: params[:publisher], comic_name: params[:comic_name], is_adult: params[:is_adult], book_name: params[:book_name], author: params[:author], publish_date: params[:publish_date])

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
      @comix = Comix
                 .where(publish_date: params[:id], is_adult: :false)
                 .select(:id, :name, :author, :publisher, "case when exists( select 1 from favorits where comixes.name like concat(favorits.title ,'%') ) then 1 else 0 END as fav ")
                 .order(fav: "DESC")
                 # .order(fav: "DESC", publisher: "ASC")
    end

    # Only allow a trusted parameter "white list" through.
    def comix_params
      params.fetch(:comix, {})
    end
end
