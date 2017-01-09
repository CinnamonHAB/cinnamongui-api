class LinkDefinitionsController < ApplicationController
  append_before_action :load_floorplan
  append_before_action :load_problem

  def index
    @link_definitions = @problem.link_definitions

    render json: @link_definitions, include: {
      predicate: {
        include: :predicate_params
      },
      link_definition_params: { }
    }
  end

  def create
    @link_definition = @problem.link_definitions.build link_definition_params
    @link_definition.save!

    ldps = params[:link_definition][:link_definition_params].map do |ldp|
      ldp.permit([:device_definition_id, :predicate_param_id])
    end

    @link_definition_params = @link_definition.link_definition_params.build ldps
    @link_definition_params.each do |ldp|
      ldp.save!
    end

    render json: @link_definition, include: {
      predicate: {
        include: :predicate_params
      },
      link_definition_params: { }
    }
  end

  def destroy
    @link_definition = @problem.link_definitions.find params[:id]
    @link_definition.destroy!

    head :ok
  end

  private

    def link_definition_params
      params.require(:link_definition).permit :predicate_id
    end

    def link_definition_params_params
      params.require(:link_definition).permit(:link_definition_params => [:device_definition_id, :predicate_param_id])
    end

    def load_floorplan
      @floorplan = Floorplan.find(params[:floorplan_id])
    end

    def load_problem
      @problem = @floorplan.problem
    end
end
