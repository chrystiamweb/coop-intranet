class CreditLinesController < ApplicationController
  before_action :set_credit_line, only: [:show, :edit, :update, :destroy]

  # GET /credit_lines
  # GET /credit_lines.json
  def index
    @credit_lines = CreditLine.all
  end

  # GET /credit_lines/1
  # GET /credit_lines/1.json
  def show
  end

  # GET /credit_lines/new
  def new
    @credit_line = CreditLine.new
  end

  # GET /credit_lines/1/edit
  def edit
  end

  # POST /credit_lines
  # POST /credit_lines.json
  def create
    @credit_line = CreditLine.new(credit_line_params)

    respond_to do |format|
      if @credit_line.save
        format.html { redirect_to @credit_line, notice: 'Credit line was successfully created.' }
        format.json { render :show, status: :created, location: @credit_line }
      else
        format.html { render :new }
        format.json { render json: @credit_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_lines/1
  # PATCH/PUT /credit_lines/1.json
  def update
    respond_to do |format|
      if @credit_line.update(credit_line_params)
        format.html { redirect_to @credit_line, notice: 'Credit line was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_line }
      else
        format.html { render :edit }
        format.json { render json: @credit_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_lines/1
  # DELETE /credit_lines/1.json
  def destroy
    @credit_line.destroy
    respond_to do |format|
      format.html { redirect_to credit_lines_url, notice: 'Credit line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_line
      @credit_line = CreditLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_line_params
      params.require(:credit_line).permit(:name, :description, :client_type, :credit_type_id)
    end
end
