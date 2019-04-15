class HomeController < ApplicationController
	def index
		@lastposts = Post.order(created_at: :desc).first(5)
		@lastnormatives = Normative.first(5)     
		@birth_days_by_month = User.where("EXTRACT(MONTH FROM birthday) = ?", Time.zone.now.month).order("extract(day from birthday) ASC")
		@birth_days_by_day = @birth_days_by_month.where("EXTRACT(DAY FROM birthday)= ?", Time.zone.now.day).order(:birthday)
	end

	def goals        
	end

	def import
		Client.import(params[:file])
		redirect_to root_url, notice: "Usuários importador com sucesso!"
	end

	def report		
		GoalsReport.import(params[:files])
		
		redirect_to root_url, notice: "Usuários importador com sucesso!"
	end

	def configs
	end
    
end
