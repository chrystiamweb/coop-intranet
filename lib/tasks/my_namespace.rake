namespace :my_namespace do
  desc "Import Users From Active Directory"
  task import_user_from_ad: :environment do
    require 'net/ldap'

    login = 'ldapUser'
    password = 'password'
    ldap = Net::LDAP.new
    ldap.host = 'hostUser'
    ldap.port = 389 
    ldap.base = 'dc=contoso,dc=com'
    ldap.auth login + '@contoso.com', password
    if ldap.bind 
      puts 'Bind Realizado com sucesso' 
     
        #search_param = # the AD account goes here
        result_attrs = ["sAMAccountName", "displayName", "mail","department"] # Whatever you want to bring back in your result set goes here
        # Build filter
        filter = Net::LDAP::Filter.eq("department", "*")
        filter2 = Net::LDAP::Filter.eq("objectCategory", "organizationalPerson")
        search_filter = Net::LDAP::Filter.join(filter,filter2)
        # Execute search
        ldap.search(filter: search_filter, attributes: result_attrs) { |item|
          user = User.find_or_create_by(login: item.sAMAccountName.first) do |user|                
            user.email = item.mail.first
            user.full_name = item.displayName.first
            user.sector_id = Sector.find_or_create_by(name: item.department.first).id
            user.location_id = Location.find_or_create_by(name: "PA#{item.sAMAccountName.first[-2,2]}").id
            user.password = password
            user.password_confirmation = password  

            puts "Foi criado o usuário #{user.full_name}"
          end        
        }
        
      
    else
      return fail('ERROR')
    end

  end

  desc "TODO"
  task my_task2: :environment do
  end

end
