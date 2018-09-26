class RequisitionsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :authenticate_user!
  before_action :set_requisition, only: [:show, :edit, :update, :destroy, :change_status]
  before_action :load_status_actions, only: [:show, :edit ]

  def index
    
    if current_user.admin? || current_user.supervisor?
      @requisitions = Requisition.search(params[:search]).order(sort_column + " " + sort_direction).open_or_closed(params[:filter]).paginate(page: params[:page], per_page:12)
    else
      @requisitions = Requisition.search(params[:search]).order(sort_column + " " + sort_direction).where(site_location: current_user.site_location).order(sort_column + " " + sort_direction).open_or_closed(params[:filter]).paginate(page: params[:page], per_page:5)
    end

    @custom_paginate_renderer = custom_paginate_renderer
  end

  def show
    set_status_options(@requisition.requisition_status_id)
  end

  def new
    @requisition = Requisition.new
  end

  def edit    
    set_status_options(@requisition.requisition_status_id)
  end

  def change_status 
  end

  def update_requisition_status
  end
  
  def create
    @requisition = Requisition.new(requisition_params)
    @requisition.requester = current_user
    @requisition.requisition_status_id = 1
    @requisition.site_location = current_user.site_location
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

  private

    def set_requisition     
      @requisition = Requisition.find(params[:id])
      @all_stats = RequisitionStatus.all
    end

    def requisition_params
      params.require(:requisition).permit(:title, :description, :requisition_status_id, :requisition_category_id, :requisition_type, :status, :status_description, :note, files:[])
    end

    def load_status_actions()     
      @status_actions = StatusAction.where(requisition_id: params[:id])      
    end  
  
    def create_new_status(requisition)
      @status = StatusAction.new
      @status.requisition_id = requisition.id
      @status.start = Time.now
      @status.requisition_status_id = requisition.requisition_status_id
      @status.action_by = current_user.full_name
      if params[:requisition][:status_description].blank?
        @status.description = "Solicitação criada"
      else
        @status.description = params[:requisition][:status_description]
      end
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

    def set_status_options(current_status)
      #if status = new the only option available will be start attendance 
      if current_status == 1 
        @status_options =  RequisitionStatus.where({ id: [1, 2]})
        #if status = in-progress the options available will be: send to approval, pending
      elsif current_status == 2
        @status_options =  RequisitionStatus.where({ id: [3, 5]})
        #if status = pending the only option will be send do analist
      elsif current_status == 4
        @status_options =  RequisitionStatus.where({ id: [4, 2]})
        #if status = pending the only option will be send do analist
      elsif current_status == 3
        @status_options =  RequisitionStatus.where({ id: [3, 4]})
      elsif current_status == 5
        @status_options =  RequisitionStatus.where({ id: [5, 6]})                
      elsif current_status == 6
        @status_options =  RequisitionStatus.where({ id: [6, 7]})
      elsif current_status == 7
        @status_options =  RequisitionStatus.where(id: 7)
      end          
    end
    def sort_column
      Requisition.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def sort_closed_items
      %w[closed].include?(params[:filter]) ? params[:filter] : "closed"
    end
  
end


 