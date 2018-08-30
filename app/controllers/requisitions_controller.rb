class RequisitionsController < ApplicationController
  before_action :set_requisition, only: [:show, :edit, :update, :destroy, :change_status]
  before_action :load_status, only: [:show, :edit ]

  def index
    @requisitions = Requisition.all
  end

  def show
  end

  def new
    @requisition = Requisition.new
  end

  def edit    
  end

  def change_status 
  end

  def update_requisition_status
  end
  
  def create
    @requisition = Requisition.new(requisition_params)
    @requisition.requester = current_user
    @requisition.requisition_status_id = 1
    respond_to do |format|
      if @requisition.save
        create_new_status(@requisition)
        format.html { redirect_to requisitions_path, notice: 'Requisition was successfully created.' }
        format.json { render :index, status: :created, location: @requisition }
      else
        format.html { render :new }
        format.json { render json: @requisition.errors, status: :unprocessable_entity }
      end
    end
  end

  def update    
    respond_to do |format|
      if @requisition.update(requisition_params.except(:status_description))
        check_if_status_has_changed(@requisition)
        format.html { redirect_to @requisition, notice: 'Requisition was successfully updated.' }
        format.json { render :show, status: :ok, location: @requisition }
      else
        format.html { render :edit }
        format.json { render json: @requisition.errors, status: :unprocessable_entity }
      end
    end    
  end

  def destroy
    @requisition.destroy
    respond_to do |format|
      format.html { redirect_to requisitions_url, notice: 'Requisition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_requisition
      @requisition = Requisition.find(params[:id])
      @all_stats = RequisitionStatus.all
    end

    def requisition_params
      params.require(:requisition).permit(:title, :description, :requisition_status_id, :requisition_category_id, :requisition_type, :status, :status_description, :note)
    end

    def load_status()     
      @status = StatusAction.where(requisition_id: params[:id])      
    end  
  
    def create_new_status(requisition)
      @status = StatusAction.new
      @status.requisition_id = requisition.id
      @status.start = Time.now
      @status.requisition_status_id = requisition.requisition_status_id
      @status.action_by = current_user.full_name
      @status.description = params[:requisition][:status_description]     
      @status.save
    end
    
    def check_if_status_has_changed(requisition)
      unless requisition.requisition_status_id == StatusAction.where(requisition_id: requisition.id).last.requisition_status_id
        finish_status_from_requisition(requisition.id)
        create_new_status(requisition)
      end
    end
  
    def finish_status_from_requisition(requisition_id)
      finished_status = StatusAction.where(requisition_id: requisition_id).last
      finished_status.finish = Time.now
      finished_status.save
    end
  
end


 