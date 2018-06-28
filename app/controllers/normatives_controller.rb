class NormativesController < ApplicationController
  before_action :set_normative, only: [ :edit, :update, :destroy]

  # GET /normatives
  # GET /normatives.json
  def index
    @normatives = Normative.all
  end

  # GET /normatives/1
  # GET /normatives/1.json
  def show
  end

  # GET /normatives/new
  def new
    @normative = Normative.new
  end

  # GET /normatives/1/edit
  def edit
  end

  # POST /normatives
  # POST /normatives.json
  def create
    @normative = Normative.new(normative_params)

    respond_to do |format|
      if @normative.save
        format.html { redirect_to normatives_url, notice: 'Normative was successfully created.' }
        format.json { render :index, status: :created, location: @normative }
      else
        format.html { render :new }
        format.json { render json: @normative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /normatives/1
  # PATCH/PUT /normatives/1.json
  def update
    respond_to do |format|
      if @normative.update(normative_params)
        format.html { redirect_to normatives_url, notice: 'Normative was successfully updated.' }
        format.json { render :index, status: :ok, location: @normative }
      else
        format.html { render :edit }
        format.json { render json: @normative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /normatives/1
  # DELETE /normatives/1.json
  def destroy
    @normative.file.purge
    @normative.destroy
    respond_to do |format|
      format.html { redirect_to normatives_url, notice: 'Normative was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_normative
      @normative = Normative.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def normative_params
      params.require(:normative).permit(:title, :description, :file)
    end
end
