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
    @comix = Comix.new(comix_params)

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
      @comix = Comix.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comix_params
      params.fetch(:comix, {})
    end
end
