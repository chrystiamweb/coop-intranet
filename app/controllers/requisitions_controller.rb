class RequisitionsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :authenticate_user!
  before_action :set_requisition, only: [:show, :edit, :update, :destroy, :change_status]
  before_action :load_status_actions, only: [:show, :edit ]
  before_action :force_json, only: :search

  def index    
    if current_user.admin? || current_user.sector_id == 2
      @requisitions = Requisition.search(params[:search]).open_or_closed(params[:filter])
    else
      @requisitions = Requisition.search(params[:search]).where(location_id: current_user.location.id).open_or_closed(params[:filter])
    end
  end
  
  def report
  end

  def show
    set_status_options(@requisition)
  end

  def new
    @requisition = Requisition.new
  end

  def edit    
    set_status_options(@requisition)
  end

  def change_status 
  end

  def update_requisition_status
  end
  
  def create
    @requisition = Requisition.new(requisition_params)
    @requisition.requester = current_user    
    @requisition.location = current_user.location    
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
    @requisition.files.find(params[:format]).purge    
    redirect_to requisition_path(@requisition)
  end

  def search
    @clients = Client.ransack(name_or_cpfcnpj_cont: params[:q]).result(distinct: true).limit(5)
  end

  private

    def set_requisition     
      @requisition = Requisition.find(params[:id])
      @all_stats = RequisitionStatus.all
    end

    def requisition_params
      params.require(:requisition).permit(:title, :description, :requisition_status_id, 
                                          :requisition_category_id, :requisition_type, 
                                          :status, :status_description, :note,:modality_id,
                                          :value, :requisition_number,:sector_flow_id,:client_id, files:[])
    end

    def load_status_actions()     
      @status_actions = StatusAction.where(requisition_id: params[:id])      
    end  
  
    def create_new_status(requisition)
      @status = StatusAction.new
      @status.requisition_id = requisition.id
      @status.requisition_status = requisition.requisition_status
      @status.start = Time.now
      @status.action_by = current_user.full_name
      @status.sector_flow_id = requisition.sector_flow_id
      if params[:requisition][:status_description].blank?
        @status.description = "Solicitação criada"
      else
        @status.description = params[:requisition][:status_description]
      end
      if @status.save
        puts 'Requisition was successfully updated.' 
      else
        byebug
      end
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

    def set_status_options(requisition)
      @status_options = ''
      if requisition.crl
        @status_options =  SectorFlow.by_status(requisition.sector_flow_id).crl_flow
      else
        @status_options =  SectorFlow.by_status(requisition.sector_flow_id).default_flow
      end 
      if requisition.can_approve
        @status_options += SectorFlow.by_status(requisition.sector_flow_id).deny_option
      end
      if requisition.can_archive
        @status_options += SectorFlow.by_status(requisition.sector_flow_id).archive_option
      end

    end

    def force_json
      request.format = :json
    end
  
end


 