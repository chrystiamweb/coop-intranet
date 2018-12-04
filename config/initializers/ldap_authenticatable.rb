require 'net/ldap'
require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class LdapAuthenticatable < Authenticatable
      def authenticate!
        if params[:user]
          ldap = Net::LDAP.new
          ldap.host = '172.19.27.2'
          ldap.port = 389 
          ldap.base = 'dc=credicope,dc=local'
          ldap.auth login + '@credicope.local', password
          if ldap.bind      
            puts "bind realizado com sucesso"      
            user = User.find_or_create_by(login: login) do |user|
              #search_param = # the AD account goes here
              result_attrs = ["sAMAccountName", "displayName", "mail"] # Whatever you want to bring back in your result set goes here
              # Build filter
              search_filter = Net::LDAP::Filter.eq("sAMAccountName", login)
              # Execute search
              ldap.search(filter: search_filter, attributes: result_attrs) { |item|                 
                user.email = item.mail.first
                user.full_name = item.displayName.first
                
                case "PA" + login.last(2)                  
                when "PA00", "PA01"
                  user.site_location = 0
                when "PA03"
                  user.site_location = 2                
                when "PA14"
                  user.site_location = 3
                when "PA19"
                  user.site_location = 4
                when "PA25"
                  user.site_location = 5
                when "PA28"
                  user.site_location = 6
                when "PA30"
                  user.site_location = 7
                when "PA31"
                  user.site_location = 8
                when "PA32"
                  user.site_location = 9
                when "PA34"
                  user.site_location = 10
                when "PA35"
                  user.site_location = 11                
                else
                  user.site_location = 1
                end                 
              }
              user.password = password
              user.password_confirmation = password
            end
            success!(user)
          else
            return fail(:invalid_login)
          end
        end
      end
      
      def login
        params[:user][:login]
      end

      def password
        params[:user][:password]
      end

    end
  end
end

Warden::Strategies.add(:ldap_authenticatable, Devise::Strategies::LdapAuthenticatable)