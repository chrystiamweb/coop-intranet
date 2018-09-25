class ApplicationController < ActionController::Base 
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def home
    end

    protected

    def configure_permitted_parameters
        added_attrs = [:login, :email, :password, :password_confirmation, :remember_me,:kind]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit(:sign_in, keys: [:login])
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end 

    def email_required?
        false        
    end

    def email_changed?
        false        
    end

    def will_save_change_to_email?
        false        
    end

    def custom_paginate_renderer
        # Return nice pagination for materialize
        Class.new(WillPaginate::ActionView::LinkRenderer) do
            def container_attributes
            {class: "pagination"}
            end
        
            def page_number(page)
            if page == current_page
                "<li class=\" active\">"+link(page, page, rel: rel_value(page))+"</li>"
            else
                "<li class=\"waves-effect\">"+link(page, page, rel: rel_value(page))+"</li>"
            end
            end
        
            def previous_page
            num = @collection.current_page > 1 && @collection.current_page - 1
            previous_or_next_page(num, "<i class=\"material-icons\">chevron_left</i>")
            end
        
            def next_page
            num = @collection.current_page < total_pages && @collection.current_page + 1
            previous_or_next_page(num, "<i class=\"material-icons\">chevron_right</i>")
            end
        
            def previous_or_next_page(page, text)
                if page
                    "<li class=\"waves-effect\">"+link(text, page)+"</li>"
                else
                    "<li class=\"waves-effect\">"+text+"</li>"
                end
            end
        end
        
    end
end
