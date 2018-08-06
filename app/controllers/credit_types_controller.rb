class CreditTypesController < ApplicationController
  before_action :set_credit_type, only: [:show, :edit, :update, :destroy]

  # GET /credit_types
  # GET /credit_types.json
  def index
    @credit_types = CreditType.all
  end

  # GET /credit_types/1
  # GET /credit_types/1.json
  def show
  end

  # GET /credit_types/new
  def new
    @credit_type = CreditType.new
  end

  # GET /credit_types/1/edit
  def edit
  end

  # POST /credit_types
  # POST /credit_types.json
  def create
    @credit_type = CreditType.new(credit_type_params)

    respond_to do |format|
      if @credit_type.save
        format.html { redirect_to @credit_type, notice: 'Credit type was successfully created.' }
        format.json { render :show, status: :created, location: @credit_type }
      else
        format.html { render :new }
        format.json { render json: @credit_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_types/1
  # PATCH/PUT /credit_types/1.json
  def update
    respond_to do |format|
      if @credit_type.update(credit_type_params)
        format.html { redirect_to @credit_type, notice: 'Credit type was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_type }
      else
        format.html { render :edit }
        format.json { render json: @credit_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_types/1
  # DELETE /credit_types/1.json
  def destroy
    @credit_type.destroy
    respond_to do |format|
      format.html { redirect_to credit_types_url, notice: 'Credit type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_type
      @credit_type = CreditType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_type_params
      params.require(:credit_type).permit(:name, :description, :client_type)
    end
end
