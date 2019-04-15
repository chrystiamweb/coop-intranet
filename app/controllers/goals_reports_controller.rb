class GoalsReportsController < ApplicationController
  before_action :set_goals_report, only: [:show, :edit, :update, :destroy]

  # GET /goals_reports
  # GET /goals_reports.json
  def index
    @goals_reports = GoalsReport.all
  end

  # GET /goals_reports/1
  # GET /goals_reports/1.json
  def show
  end

  # GET /goals_reports/new
  def new
    @goals_report = GoalsReport.new
  end

  # GET /goals_reports/1/edit
  def edit
  end

  # POST /goals_reports
  # POST /goals_reports.json
  def create
    @goals_report = GoalsReport.new(goals_report_params)

    respond_to do |format|
      if @goals_report.save
        format.html { redirect_to @goals_report, notice: 'Goals report was successfully created.' }
        format.json { render :show, status: :created, location: @goals_report }
      else
        format.html { render :new }
        format.json { render json: @goals_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals_reports/1
  # PATCH/PUT /goals_reports/1.json
  def update
    respond_to do |format|
      if @goals_report.update(goals_report_params)
        format.html { redirect_to @goals_report, notice: 'Goals report was successfully updated.' }
        format.json { render :show, status: :ok, location: @goals_report }
      else
        format.html { render :edit }
        format.json { render json: @goals_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals_reports/1
  # DELETE /goals_reports/1.json
  def destroy
    @goals_report.destroy
    respond_to do |format|
      format.html { redirect_to goals_reports_url, notice: 'Goals report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goals_report
      @goals_report = GoalsReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goals_report_params
      params.require(:goals_report).permit(:name, :description, :goal_category_id, :location_id, :report_img)
    end
end
