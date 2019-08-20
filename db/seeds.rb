require 'csv'
puts 'iniciando SEED'

FileType.create!(name: 'Padrão', description: 'Defalt Description')
FileType.create!(name: 'Formulários', description: 'Defalt Description')
FileType.create!(name: 'Manuais', description: 'Defalt Description')
FileType.create!(name: 'Outros', description: 'Defalt Description') 

fotoname = [ 'hero.jpg', 'loop.jpg', 'nat-1.jpg', 'nat-2.jpg',
             'nat-3.jpg', 'nat-4.jpg', 'nat-5.jpg', 'soft.jpg'
            ]

fotoname.each do |i|
  temp = Post.new(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph(5)
  )   
  temp.image.attach(
    io: File.open("public/img/#{i}"), 
    filename: i, content_type: 'image/jpg'
    )
  temp.save!
end

puts 'Criando localidades padrões'
100.times do |p|
  Location.create(
    name: p < 9 ? "PA0#{p}" : "PA#{p}" ,
    description: Faker::Lorem.sentence
  )
end

puts 'criando setores'

 
sectors = ['PA','Credito','Cadastro','Controladoria','Recursos Humanos',
            'Departamento Pessoal','OQS','Juridico','Produtos',
            'Marketing','Inteligencia Competitiva','Gerencia','Diretoria Executiva',
            'Conselho', 'Controle Interno','T.I.'
          ]

sectors.each do |sector|
  Sector.create!(
    name: sector,
    description: Faker::Lorem.sentence
  )
end
puts 'Definindo FLuxos do sistema'

 
flows = ['Atendimento','Credito','Cadastro','Aprovação','Formalização	',
          'Dossiê','Conferência','Arquivo'
        ]


8.times do |s|
  SectorFlow.create!(
    name: flows[s],
    sector_id: s%2 == 0 ?  Sector.where(id: 1).first.id : Sector.where(id: 2).first.id,
    position: s+1
  )
end

puts 'Criando usuário padrão'
User.create(  
    full_name: 'Administrador Padrão',
    login: 'admin',
    birthday: Faker::Date.birthday(18, 65),
    role: 0,
    location: Location.first,
    sector_id: Sector.last.id,
    email: 'teste@teste.com', 
    password: '123456',
    password_confirmation: '123456',
    kind: 0
  )
puts 'usuário padrão Criado '

puts 'Cirando usuários de teste'
50.times do
  User.create(
    full_name: Faker::Name.name,
    login: Faker::Internet.user_name,
    birthday: Faker::Date.birthday(18, 65),
    role: [0,1,2,4,5,6,7,8,9,10].sample,
    location: Location.all.sample,
    email:Faker::Internet.email, 
    role: [0, 1, 2, 4, 5, 6, 7, 8, 9, 10].sample,
    location: Location.all.sample,
    sector_id: Sector.all.sample.id,
    email: Faker::Internet.email,
    password: '123456',
    password_confirmation: '123456', 
    kind: [0, 1, 2].sample
  )
end

150.times do
  Client.create(
    name: Faker::Name.name,
    cpfcnpj: 98765432999999,
    income_type: "TESTE",
    category: "Categoria",
    rating: "R#{[0,1,2,4,5,6,7].sample}",
    location: Location.all.sample
  )
end

puts 'cadastrando tipos de credito'

tipos = [ 'Linhas de crédito pessoa física',
          'LINHAS DE CRÉDITO PESSOA JURÍDICA'
        ]

tipos.each do |tipo|
  a = CreditType.new
  a.name = tipo
  a.description = tipo
  a.save
end

puts 'tipos de credito cadastrados'

puts 'Cadastrando Linhas de  credito'
lines = [{
            name: 'Linha de credito pessoa física 01',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 1,
            prazo_max: 1,
            tax_max: 1,
            tax_min: 4
          },
          { name: 'Linha de credito pessoa física 02',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 1,
            prazo_max: 1,
            tax_max: 2.9,
            tax_min: 6.9
          },
          { name: 'Linha de crédito 03',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 1,
            prazo_max: 1,
            tax_max: 4.45,
            tax_min: 4.45
          },
          { name: 'LINHAS DE CRÉDITO PESSOA JURÍDICA 01',
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 0,
            prazo_min: 1,
            prazo_max: 12,
            tax_max: 3.19,
            tax_min: 3.0
          },
          { name: 'LINHAS DE CRÉDITO PESSOA JURÍDICA 02',
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 0,
            prazo_min: 13,
            prazo_max: 24,
            tax_max: 3.39,
            tax_min: 3.20
          }
         ]
lines.each do |li|
  nline = CreditLine.new
  nline.name = li[:name]
  nline.description = li[:name]
  nline.client_type =  li[:config]
  nline.credit_type_id = CreditType.where(name: li[:type]).last.id
  nline.save!
  ldef = CreditLineSetting.new
  ldef.name = li[:name]
  ldef.description = li[:name]
  ldef.client_type =  li[:config]
  ldef.credit_line_id = nline.id
  ldef.deadline_max = li[:prazo_max]
  ldef.deadline_min = li[:prazo_min]
  ldef.tax_max = li[:tax_max]
  ldef.tax_min =  li[:tax_min]
  ldef.deadline_setup = 0
  ldef.save!
  puts li[:name]
end

puts 'Linhas de credito cadastradas'

puts 'cadastrando criterios de avaliação'

criterios = [{ name: 'Reciprocidade de Pedras', value: 30},
             { name: 'Nota de Risco CRL',value: 20},
             { name: 'Score de Crédito',value: 30},
             { name: 'Garantias', value: 30},
             { name: 'IAP', value: 30}]              

 csetups = [{ name: '> R8',                    value: 0   ,fth: 'Nota de Risco CRL'},
            { name: 'R5 - R7',                 value: 30  ,fth: 'Nota de Risco CRL'},
            { name: 'R4',                      value: 70  ,fth: 'Nota de Risco CRL'},
            { name: 'Menor que R3',            value: 100 ,fth: 'Nota de Risco CRL'},
            { name: '< 351',               value: 0  ,fth: 'Score de Crédito'},
            { name: '351 - 450',               value: 20  ,fth: 'Score de Crédito'},
            { name: '451 - 600',               value: 60  ,fth: 'Score de Crédito'},
            { name: '601 - 750',               value: 80  ,fth: 'Score de Crédito'},
            { name: '>751',                    value: 100 ,fth: 'Score de Crédito'},
            { name: 'Sem garantia',            value: 0   ,fth: 'Garantias'},
            { name: 'Aval de Terceiros',       value: 10  ,fth: 'Garantias'},
            { name: 'Cobrança',                value: 10  ,fth: 'Garantias'},
            { name: 'Alienaçãoo de Veículos',   value: 20  ,fth: 'Garantias'},
            { name: 'Alienaçãoo de Otros bens', value: 20  ,fth: 'Garantias'},
            { name: 'Hipoteca',                value: 15  ,fth: 'Garantias'},
            { name: 'Aplicação Financeira',    value: 20  ,fth: 'Garantias'},
            { name: 'Seguro',                  value: 10  ,fth: 'Garantias'},
            { name: '< 2 Produtos',            value: 0   ,fth: 'IAP'},
            { name: 'entre 3 e 4 produtos',    value: 25  ,fth: 'IAP'},
            { name: 'entre 5 e 7 produtos',    value: 50  ,fth: 'IAP'},
            { name: '> 7 produtos',            value: 100 ,fth: 'IAP'}]

criterios.each do |criterio|
  cdata = Criterium.new
  cdata.name = criterio[:name]
  cdata.description = criterio[:name]
  cdata.save

  impc = CriteriaImpactDefinition.new
  impc.criterium_id = cdata.id
  impc.impact = criterio[:value]
  impc.save!
  
  puts criterio[:name]
end

puts 'criterios cadastrados com sucesso'

csetups.each do |sstup|
  csetups = CriteriaSetup.new
  csetups.criterium_id =  Criterium.where(name: sstup[:fth]).last.id
  csetups.criteria_name = sstup[:name]
  csetups.description = sstup[:name]
  csetups.value = sstup[:value]
  csetups.real_value = (
                       (sstup[:value] * CriteriaImpactDefinition.where(
                        criterium_id: csetups.criterium_id).last.impact) / 100)
  csetups.save
end
statuses = ['Aguardando atendimento','Em atendimento','Finalizado']

statuses.each do |status|
    new_status = RequisitionStatus.new
    new_status.name = status
    new_status.save
end

categories = ['nova proposta','crl']

categories.each do |category|
    new_category = RequisitionCategory.new
    new_category.name = category
    new_category.save
end

tipos.each do |tipo|
  a = Modality.new
  a.title = tipo
  a.description = tipo
  a.save
end

puts "Cadastrando requisições"
30.times do |n|
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
    flag: 0
  )
end
puts "Requisições Cadastradas"
puts "Atualizando requisições"
Requisition.all.each do |req|
 StatusAction.create!(
  requisition_id: req.id,
  start: Time.now,
  requisition_status_id: req.requisition_status_id,                             
  action_by:  User.all.sample.login,
  sector_flow_id: req.sector_flow_id
 )
end
GoalCategory.create!(
  name: 'Carteira Diária',
  description: 'Acompanhamento de metas da carteira geradas di�riamente'
)

puts 'requisições atualizadas'


ReportType.create!(
  name: 'Carteira Diária',
  description: 'Acompanhamento de metas da carteira geradas di�riamente'
)

puts 'requisições atualizadas'