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
                puts "#{item.sAMAccountName.first}: #{item.displayName.first} (#{item.mail.first})" 
                user.email = item.mail.first
                user.full_name = item.displayName.first
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