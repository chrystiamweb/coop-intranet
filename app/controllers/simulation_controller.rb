class SimulationController < ApplicationController
  before_action :get_credit_lines, only: [:index,:sim]

  def index 
    set_criterias_based_on_ids  
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

  def set_criterias_based_on_ids
    @reciproc   = CriteriaSetup.all.where(criterium_id: 1)
    @crl   = CriteriaSetup.all.where(criterium_id: 2)
    @score   = CriteriaSetup.all.where(criterium_id: 3)
    @garantia   = CriteriaSetup.all.where(criterium_id: 4)   
  end

end
