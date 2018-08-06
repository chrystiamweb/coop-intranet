class CriteriaSetupsController < ApplicationController
  before_action :set_criteria_setup, only: [:show, :edit, :update, :destroy]

  # GET /criteria_setups
  # GET /criteria_setups.json
  def index
    @criteria_setups = CriteriaSetup.all
  end

  # GET /criteria_setups/1
  # GET /criteria_setups/1.json
  def show
  end

  # GET /criteria_setups/new
  def new
    @criteria_setup = CriteriaSetup.new
  end

  # GET /criteria_setups/1/edit
  def edit
  end

  # POST /criteria_setups
  # POST /criteria_setups.json
  def create
    @criteria_setup = CriteriaSetup.new(criteria_setup_params)

    respond_to do |format|
      if @criteria_setup.save
        format.html { redirect_to @criteria_setup, notice: 'Criteria setup was successfully created.' }
        format.json { render :show, status: :created, location: @criteria_setup }
      else
        format.html { render :new }
        format.json { render json: @criteria_setup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /criteria_setups/1
  # PATCH/PUT /criteria_setups/1.json
  def update
    respond_to do |format|
      if @criteria_setup.update(criteria_setup_params)
        format.html { redirect_to @criteria_setup, notice: 'Criteria setup was successfully updated.' }
        format.json { render :show, status: :ok, location: @criteria_setup }
      else
        format.html { render :edit }
        format.json { render json: @criteria_setup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criteria_setups/1
  # DELETE /criteria_setups/1.json
  def destroy
    @criteria_setup.destroy
    respond_to do |format|
      format.html { redirect_to criteria_setups_url, notice: 'Criteria setup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_criteria_setup
      @criteria_setup = CriteriaSetup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def criteria_setup_params
      params.require(:criteria_setup).permit(:criterium_id, :criteria_name, :description, :value, :real_value)
    end
end
