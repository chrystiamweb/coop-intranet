class HomeController < ApplicationController
	def index
		@lastposts = Post.order(created_at: :desc).first(5)
		@lastnormatives = Normative.first(5)     
		@birth_days_by_month = User.where("EXTRACT(MONTH FROM birthday) = ?", Time.zone.now.month).order("extract(day from birthday) ASC")
		@birth_days_by_day = @birth_days_by_month.where("EXTRACT(DAY FROM birthday)= ?", Time.zone.now.day).order(:birthday)
		user_signed_in? ? @report = GoalsReport.same_location(current_user.location) : @report = GoalsReport.by_last_location
		@daily_news = Journal.last
	end

	def goals   
		@reports = GoalsReport.last(13)     
	end

	def import
		Client.import(params[:file])
		redirect_to root_url, notice: "Usuários importador com sucesso!"
	end

	def report		
		GoalsReport.import(params[:files])
		
		redirect_to root_url, notice: "Relatórios importador com sucesso!"
	end

	def configs
	end
    
end
