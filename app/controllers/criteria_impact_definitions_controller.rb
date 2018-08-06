class CriteriaImpactDefinitionsController < ApplicationController
  before_action :set_criteria_impact_definition, only: [:show, :edit, :update, :destroy]

  # GET /criteria_impact_definitions
  # GET /criteria_impact_definitions.json
  def index
    @criteria_impact_definitions = CriteriaImpactDefinition.all
  end

  # GET /criteria_impact_definitions/1
  # GET /criteria_impact_definitions/1.json
  def show
  end

  # GET /criteria_impact_definitions/new
  def new
    @criteria_impact_definition = CriteriaImpactDefinition.new
  end

  # GET /criteria_impact_definitions/1/edit
  def edit
  end

  # POST /criteria_impact_definitions
  # POST /criteria_impact_definitions.json
  def create
    @criteria_impact_definition = CriteriaImpactDefinition.new(criteria_impact_definition_params)

    respond_to do |format|
      if @criteria_impact_definition.save
        format.html { redirect_to @criteria_impact_definition, notice: 'Criteria impact definition was successfully created.' }
        format.json { render :show, status: :created, location: @criteria_impact_definition }
      else
        format.html { render :new }
        format.json { render json: @criteria_impact_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /criteria_impact_definitions/1
  # PATCH/PUT /criteria_impact_definitions/1.json
  def update
    respond_to do |format|
      if @criteria_impact_definition.update(criteria_impact_definition_params)
        format.html { redirect_to @criteria_impact_definition, notice: 'Criteria impact definition was successfully updated.' }
        format.json { render :show, status: :ok, location: @criteria_impact_definition }
      else
        format.html { render :edit }
        format.json { render json: @criteria_impact_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criteria_impact_definitions/1
  # DELETE /criteria_impact_definitions/1.json
  def destroy
    @criteria_impact_definition.destroy
    respond_to do |format|
      format.html { redirect_to criteria_impact_definitions_url, notice: 'Criteria impact definition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_criteria_impact_definition
      @criteria_impact_definition = CriteriaImpactDefinition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def criteria_impact_definition_params
      params.require(:criteria_impact_definition).permit(:criteria_id, :impact)
    end
end
