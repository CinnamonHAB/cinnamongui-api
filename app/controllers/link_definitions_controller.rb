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
  end

  def update
  end

  def destroy
  end

  private

    def load_floorplan
      @floorplan = Floorplan.find(params[:floorplan_id])
    end

    def load_problem
      @problem = @floorplan.problem
    end
end
