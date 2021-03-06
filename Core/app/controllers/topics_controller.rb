require "lib_han_zen.rb"

class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :update, :destroy]

  # GET /topics
  def index
    @topics = Topic.all

    render json: @topics
  end

  # GET /topics/1
  def show
    render json: @topic
  end

  # GET /topics/yyyymmdd/yyyymmdd
  def list
    @topic = Topic
             .select('name, count(*) ')
             .where('week > ?', params[:begin])
             .where('week <= ?',  params[:end])
             .group('name')
             .order("count(*) DESC")
    render json: @topic
  end

  # POST /topics
  def create
    req = JSON.parse(request.body.read)
    if !req.blank?
      top_res = req
    else
      top_res = {'status' => 500}
    end

    req.each do |r|
      @topic = Topic.find_by(name: narrow_to_wide(r["name"]), week: r["week"])
      if @topic
      else
        @topic = Topic.new(name: narrow_to_wide(r["name"]), week: r["week"])
        @topic.save
      end
    end

    render top_res
  end

  # # PATCH/PUT /topics/1
  # def update
  #   if @topic.update(topic_params)
  #     render json: @topic
  #   else
  #     render json: @topic.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /topics/1
  # def destroy
  #   @topic.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def topic_params
      params.require(:topic).permit(:name, :week)
    end
end
