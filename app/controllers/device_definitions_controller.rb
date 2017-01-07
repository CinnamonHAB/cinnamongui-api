class DeviceDefinitionsController < ApplicationController
  append_before_action :load_floorplan
  append_before_action :load_problem

  def show
    @device_definition = @problem.device_definitions.find params[:id]
    render json: @device_definition, include: {
      predicate: {
        include: :predicate_params
      }
    }
  end

  def create
    @device_definition = @problem.device_definitions.build device_definition_params
    @device_definition.save!

    @floorplan_object = @device_definition.build_floorplan_object floorplan_object_params
    @floorplan_object.save!

    render json: @device_definition, include: {
      predicate: {
        include: :predicate_params
      },
      floorplan_object: { }
    }
  end

  def update
    @device_definition = @problem.device_definitions.find params[:id]
    @device_definition.update_attributes! device_definition_params
    @device_definition.floorplan_object.update_attributes! floorplan_object_params

    render json: @device_definition, include: {
      predicate: {
        include: :predicate_params
      },
      floorplan_object: { }
    }
  end

  private

    def device_definition_params
      params.require(:device_definition).permit :name, :predicate_id
    end

    def floorplan_object_params
      params.require(:device_definition).require(:floorplan_object).permit(:angle, :background_color, :fill, :height, :width, :left, :top, :opacity, :scale_x, :scale_y)
    end

    def load_floorplan
      @floorplan = Floorplan.find(params[:floorplan_id])
    end

    def load_problem
      @problem = @floorplan.problem
    end
end
