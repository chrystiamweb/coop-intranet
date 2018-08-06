class CreditLineSettingsController < ApplicationController
  before_action :set_credit_line_setting, only: [:show, :edit, :update, :destroy]

  # GET /credit_line_settings
  # GET /credit_line_settings.json
  def index
    @credit_line_settings = CreditLineSetting.all
  end

  # GET /credit_line_settings/1
  # GET /credit_line_settings/1.json
  def show
  end

  # GET /credit_line_settings/new
  def new
    @credit_line_setting = CreditLineSetting.new
  end

  # GET /credit_line_settings/1/edit
  def edit
  end

  # POST /credit_line_settings
  # POST /credit_line_settings.json
  def create
    @credit_line_setting = CreditLineSetting.new(credit_line_setting_params)

    respond_to do |format|
      if @credit_line_setting.save
        format.html { redirect_to @credit_line_setting, notice: 'Credit line setting was successfully created.' }
        format.json { render :show, status: :created, location: @credit_line_setting }
      else
        format.html { render :new }
        format.json { render json: @credit_line_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_line_settings/1
  # PATCH/PUT /credit_line_settings/1.json
  def update
    respond_to do |format|
      if @credit_line_setting.update(credit_line_setting_params)
        format.html { redirect_to @credit_line_setting, notice: 'Credit line setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_line_setting }
      else
        format.html { render :edit }
        format.json { render json: @credit_line_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_line_settings/1
  # DELETE /credit_line_settings/1.json
  def destroy
    @credit_line_setting.destroy
    respond_to do |format|
      format.html { redirect_to credit_line_settings_url, notice: 'Credit line setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_line_setting
      @credit_line_setting = CreditLineSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_line_setting_params
      params.require(:credit_line_setting).permit(:name, :description, :credit_line_id, :deadline_max, :deadline_min, :tax_description, :tax_max, :tax_min, :client_type, :deadline_setup)
    end
end
