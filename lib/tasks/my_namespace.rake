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

  desc "create requisitions for test"
  task create_requisitions: :environment do
    puts "Cadastrando requisições"
    100.times do |days|
      reqs = rand(50)
      reqs.times do |n|
        testuser = User.all.sample
        mod = Modality.all.sample
        Requisition.create!(
          title: Faker::Lorem.sentence,    
          description: Faker::Lorem.paragraph(5),
          requisition_status_id: 1,
          requisition_category_id: RequisitionCategory.all.sample.id,
          requester_id: testuser.id,
          location_id: testuser.location.id,
          client_id: Client.all.sample.id, 
          modality_id: mod.id,
          sector_flow_id: 1,
          value: 9999.99,
          requisition_number: rand(9999999),
          flag: 0, 
          created_at: days.day.from_now
        )
       end

        puts "Requisições Cadastradas"
        puts "Atualizando requisições"
        Requisition.last(reqs).each do |req|
        StatusAction.create!(
          requisition_id: req.id,
          start: Time.current,
          requisition_status_id: req.requisition_status_id,                             
          action_by:  User.all.sample.login,
          sector_flow_id: req.sector_flow_id
        )
        end
    end

    
  end

end
