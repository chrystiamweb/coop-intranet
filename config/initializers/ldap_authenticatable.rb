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
            user = User.find_or_create_by(login: login) do |user|
              #search_param = # the AD account goes here
              result_attrs = ["sAMAccountName", "displayName", "mail","department"] # Whatever you want to bring back in your result set goes here
              # Build filter
              search_filter = Net::LDAP::Filter.eq("sAMAccountName", login)
              # Execute search
              ldap.search(filter: search_filter, attributes: result_attrs) { |item|                 
              user.email = item.mail.first
              user.full_name = item.displayName.first
              user.sector_id = Sector.find_or_create_by(name: item.department.first).id
              user.location_id = Location.find_or_create_by(name: "PA#{item.sAMAccountName.first[-2,2]}").id              
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