class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]


  def index
    @events = Event.where(start: params[:start]..params[:end])
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)   
    respond_to do |format|
      if @event.save 
        format.html {render :index, notice: 'Docfile was successfully updated.'}       
        format.json {render :index, notice: 'Docfile was successfully updated.' }
      else        
        format.html { render :index }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @event.update(event_params)
    respond_to do |format|
      if @event.update(event_params)
        format.html {render :index, notice: 'Docfile was successfully updated.'}       
        format.json {render :index, notice: 'Docfile was successfully updated.' }
      else        
        format.html { render :index }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :color)
    end
end
