class HomeController < ApplicationController
    def index
     @lastposts = Post.last(5)
     @lastnormatives = Normative.last(5)     
     @birth_days_by_month = User.where("EXTRACT(MONTH FROM birthday) = ?", Time.zone.now.month).order("extract(day from birthday) ASC")
     @birth_days_by_day = @birth_days_by_month.where("EXTRACT(DAY FROM birthday)= ?", Time.zone.now.day).order(:birthday)
    end
end
