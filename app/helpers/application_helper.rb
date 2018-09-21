module ApplicationHelper
    def check_access(user,site_location,status)
        if (user.admin? || user.supervisor?) && [1,2,4,5].include?(status)
            true
        elsif (user.site_location == site_location) && [3,6].include?(status)
            true
        else 
            false
        end        
    end

    def user_can_edit_requisition(user,site_location,status)

        unless check_access(user,site_location,status)            
            'disabled'
        end

    end



end
