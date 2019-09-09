class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @reports = Report.by_type(params[:type]).order(created_at: :desc) 
  end

  def show
  end

  def new
    @report = Report.new
  end

  def edit
  end

  def new_type    
    ReportType.create(
      name: params[:report_type]
    )
  end

  def reports_from_location
    @reports = Report.last_per_type
    @lastlocation = Location.last_location
  end

  def report_types
   render json: ReportType.last
  end
  def create
    @report = Report.new(report_params.except(:images,:report_type))
    @report.action_by = current_user.full_name
    respond_to do |format|
      if @report.save
        if report_params[:images]
          @report.add_images_to_report(report_params)
        end
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @report.update(report_params.except(:images,:report_type))
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_report
      @report = Report.find(params[:id])
    end

    def report_params
      params.require(:report).permit(:name, :report_type_id, :action_by, :file,:report_type, :type, images:[])
    end
end
