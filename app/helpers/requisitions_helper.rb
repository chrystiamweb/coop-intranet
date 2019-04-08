module RequisitionsHelper
    def time_req_calc
            status = StatusAction.closed.select("sector_flow_id").distinct 
            status_time_calc = []
            media_calc = 0
            status.each do |stat|                
                medias = StatusAction.where(sector_flow_id: stat.sector_flow_id).closed
                medias.each do |m|
                    media_calc +=  diff_time(m.start,m.finish)
                end
               media_calc /= medias.count
                puts [stat.sector_flow.name, media_calc]
                status_time_calc << [stat.sector_flow.name,media_calc]
            end
            puts "STATUS TIME TEST"
            status_time_calc
    end

    def diff_time(start,finish)       
        ((finish - start) / 1.hour).round
    end
end
