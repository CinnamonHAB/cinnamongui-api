class FloorplansController < ApplicationController
  before_action :set_floorplan, only: [:show, :update, :destroy]

  # GET /floorplans
  def index
    @floorplans = Floorplan.all

    render json: @floorplans
  end

  # GET /floorplans/1
  def show
    render json: @floorplan, include: {
      domain: {
        include: {
          predicates: { include: :predicate_params }
        }
      },
      problem: {
        include: :device_definitions
      }
    }
  end

  private

    def set_floorplan
      @floorplan = Floorplan.find(params[:id])
    end
end
