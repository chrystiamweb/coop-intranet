class SimulationController < ApplicationController
  before_action :get_credit_lines, only: [:sim]

  def index 
    set_criterias_based_on_ids
    set_line_by_client(params[:client_type])
    respond_to do |format|
      format.html

      format.pdf { 
        render pdf: "Report",
        header: {center: 'Simulador'},
        footer: {center: "[page] of [topage]" }
      }
    end
  end

  def sim      
  end

  def new_sim
    set_credit_data(params[:credit_line])
    set_criterias_based_on_ids
    
    respond_to do |format|
      format.js 
    end
  end

  private
  def get_credit_lines
    @credit_lines = CreditLineSetting.all     
  end

  def set_credit_data(params)
    @credit_data = CreditLineSetting.where(id: params)
  end

  def set_line_by_client(params)
    @line_by_client = CreditLineSetting.where(client_type: params)
  end

  def set_criterias_based_on_ids
    @reciproc   = CriteriaSetup.all.where(criterium_id: 1)
    @crl   = CriteriaSetup.all.where(criterium_id: 2)
    @score   = CriteriaSetup.all.where(criterium_id: 3)
    @garantia   = CriteriaSetup.all.where(criterium_id: 4)   
  end

end
