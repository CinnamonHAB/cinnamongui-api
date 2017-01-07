class FloorplanObjectsController < ApplicationController
  before_action :set_floorplan_object, only: [:show, :update, :destroy]

  # GET /floorplan_objects
  def index
    @floorplan_objects = FloorplanObject.all

    render json: @floorplan_objects
  end

  # GET /floorplan_objects/1
  def show
    render json: @floorplan_object
  end

  # POST /floorplan_objects
  def create
    @floorplan_object = FloorplanObject.new(floorplan_object_params)

    if @floorplan_object.save
      render json: @floorplan_object, status: :created, location: @floorplan_object
    else
      render json: @floorplan_object.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /floorplan_objects/1
  def update
    if @floorplan_object.update(floorplan_object_params)
      render json: @floorplan_object
    else
      render json: @floorplan_object.errors, status: :unprocessable_entity
    end
  end

  # DELETE /floorplan_objects/1
  def destroy
    @floorplan_object.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_floorplan_object
      @floorplan_object = FloorplanObject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def floorplan_object_params
      params.require(:floorplan_object).permit(:angle, :background_color, :fill, :height, :width, :left, :top, :opacity, :scaleX, :scaleY)
    end
end
