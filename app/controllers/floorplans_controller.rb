class FloorplansController < ApplicationController
  before_action :set_floorplan, only: [:show, :update, :destroy, :apply]

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
        include: {
          device_definitions: {
            include: {
              predicate: {
                include: :predicate_params
              },
              floorplan_object: {}
            }
          }
        }
      }
    }
  end

  def apply
    lamps = @floorplan.problem.device_definitions.select{|dd| dd.predicate.keyword == 'LAMP' }
    switches = @floorplan.problem.device_definitions.select{|dd| dd.predicate.keyword == 'SWITCH' }

    target_states_json = {}
    switches.each do |switch|
      target_states_json[switch.name] = {
        "ON" => {},
        "OFF" => {}
      }
      switch.link_definition_params.each do |link_definition_param|
        target_states_json[switch.name]["ON"][link_definition_param.link_definition.link_definition_params.second.device_definition.name] = true
        target_states_json[switch.name]["OFF"][link_definition_param.link_definition.link_definition_params.second.device_definition.name] = false
      end
    end

    target_states_json['action0'] = {
      "ON" => {},
      "OFF" => {}
    }
    lamps.each do |lamp|
      target_states_json['action0']['ON'][lamp.name] = true
      target_states_json['action0']['OFF'][lamp.name] = false
    end


    itemsfile = 'Group g "Beta"    <firstfloor>'
    lamps.each do |lamp|
      itemsfile += "\nSwitch #{lamp.name} \"#{lamp.name}\" (g)"
    end
    itemsfile += "\nSwitch action0 \"All Lights\" (g)"

    problem_objects_block = "(:objects #{lamps.map(&:name).join(' ')})"
    problem_init_block = "\n(:init"
    @floorplan.problem.device_definitions.each do |dd|
      problem_init_block += "\n(#{dd.predicate.keyword} #{dd.name})"
    end
    @floorplan.problem.link_definitions.each do |ld|
      problem_init_block += "\n(#{ld.predicate.keyword} #{ld.link_definition_params.map(&:device_definition).map(&:name).join(' ')})"
    end
    problem_init_block += "\n)"

    
    File.open('/tmp/target_states.json', 'w') do |f|
      f.puts target_states_json
    end
    File.open('/tmp/demo.items', 'w') do |f|
      f.puts itemsfile
    end
    File.open('/tmp/pddl_init.txt', 'w') do |f|
      f.puts(problem_objects_block + problem_init_block)
    end

    `docker restart cinnamonhab_openhab_1`
    #render json: target_states_json
  end

  private

    def set_floorplan
      @floorplan = Floorplan.find(params[:floorplan_id] || params[:id])
    end
end
