module RequisitionsHelper
    def global_time_calc(category)         
        medias = StatusAction.where(requisition_id: closed_requisitions(category)).includes(:sector_flow)
        status_time_by_requisition(medias,category)                      
    end

    def requisiton_total_time_count(category)
        media = 0
        closed_requisitions(category).each do |requisition|
            media += diff_time(requisition.created_at, StatusAction.where(requisition_id: requisition.id).last.created_at)               
        end
        (media / closed_requisitions(category).count).round(2)
    end

    def diff_time(start,finish)            
        finish ||= start            
        ((finish - start) / 1.hour).round(2)
    end

    def closed_requisitions(category)
        Requisition.find_by_date.closed.where(requisition_category_id: category)
    end

    def status_time_by_requisition(status, category)
        status_time_calc = {}       
        status.each do |stat|
            if status_time_calc.has_key?(stat.sector_flow.name)
                status_time_calc[stat.sector_flow.name] += diff_time(stat.start,stat.finish)
            else
                status_time_calc[stat.sector_flow.name] = diff_time(stat.start,stat.finish)
            end
        end         
        status_time_calc.map { |key,value| status_time_calc[key] = value / get_data_count(key,category) }
        status_time_calc
    end

    def get_data_count(query,category)
        puts query
        query_id = SectorFlow.where(name:query).first.id
        StatusAction.where(requisition_id: closed_requisitions(category)).where(sector_flow_id: query_id).count / 2
    end
end
