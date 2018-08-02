puts 'iniciando SEED SEED SEED'

FileType.create!(name: 'Padrão', description:'Defalt Description')
FileType.create!(name: 'Formulários', description:'Defalt Description')
FileType.create!(name: 'Manuais', description:'Defalt Description')
FileType.create!(name: 'Outros', description:'Defalt Description') 

fotoname = ['hero.jpg', 'loop.jpg', 'nat-1.jpg', 'nat-2.jpg', 'nat-3.jpg', 'nat-4.jpg', 'nat-5.jpg', 'soft.jpg']

fotoname.each do |i|
  temp = Post.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph(5),
  )   
  temp.image.attach(io: File.open("public/img/#{i}"), filename: i, content_type:'image/jpg')
end

puts 'Criando usuário padrão'
User.create(  
    full_name: 'Administrador Padrão',
    login: 'teste3047-00',
    birthday: Faker::Date.birthday(18, 65),
    role: 0 ,
    site_location: 0,
    email:'teste@teste.com', 
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
    site_location: [0,1,2,4].sample,
    email:Faker::Internet.email, 
    password: '123456',
    password_confirmation: '123456',
    kind: [0,1,2].sample  
  )
end

puts 'cadastrando tipos de credito'

tipos = [ 'PRÉ-APROVADO SICOOB',
          'LIMITES SICOOB',
          'PRODUTOS DE CRÉDITO',
          'PRÉ-APROVADO SICOOB',
          'LIMITES SICOOB',
          'PRODUTOS DE CRÉDITO',
          'FINANCIAMENTO ',
          'CRÉDITO RURAL']

tipos.each do |tipo|
  a = CreditType.new
  a.name = tipo
  a.description = tipo
  a.save
end

puts 'tipos de credito cadastrados'

puts 'Cadastrando Linhas de  credito'
lines = [ {
            name:'Crédito Pré-Aprovado SICOOB',
            type:'PRÉ-APROVADO SICOOB',
            config:1,
            prazo_min: 3,
            prazo_max: 36,
            tax_max: 2,
            tax_min: 1.7
          },
          {
            name:'Adiantamento a Depositante',
            type:'PRÉ-APROVADO SICOOB',
            config:1,
            prazo_min: 1,
            prazo_max: 1,
            tax_min: 13,
            tax_max: 13
          },
          {
            name:'SICOOB CONTA GARANTIDA - Clean',
            type:'LIMITES SICOOB',
            config:1,
            prazo_min: 12,
            prazo_max: 12,
            tax_max: 6.37,
            tax_min: 5.11
          },
          {
            name:'SICOOB CONTA GARANTIDA COM GARANTIAS - Recebíveis de Cartões ',
            type:'LIMITES SICOOB',
            config:1,
            prazo_min: 12,
            prazo_max: 12,
            tax_max: 2.39,
            tax_min: 1.54
          },
          {
            name:'SICOOB CONTA GARANTIDA COM GARANTIAS - Caução de Boletos de Cobrança',
            type:'LIMITES SICOOB',
            config:1,
            prazo_min: 12,
            prazo_max: 12,
            tax_max: 2.39,
            tax_min: 1.54
          },
          {
            name:'SICOOB CONTA GARANTIDA COM GARANTIAS - Caução de Cheques',
            type:'LIMITES SICOOB',
            config:1,
            prazo_min: 12,
            prazo_max: 12,
            tax_max: 2.39,
            tax_min: 1.54
          },
          {
            name:'SICOOB CONTA GARANTIDA COM GARANTIAS - Alienação Fiduciaria ',
            type:'LIMITES SICOOB',
            config:1,
            prazo_min: 12,
            prazo_max: 12,
            tax_max: 2.39,
            tax_min: 1.54
          },
          {
            name:'CRÉDITO PESSOAL SICOOB ROTATIVO',
            type:'LIMITES SICOOB',
            config:1,
            prazo_min: 12,
            prazo_max: 12,
            tax_max: 6.3,
            tax_min: 1.54
          },
          {
            name:'DESCONTO DE CHEQUES',
            type:'LIMITES SICOOB',
            config:1,
            prazo_min: 12,
            prazo_max: 12,
            tax_max: 3.18,
            tax_min: 1.54
          },
          {
            name:'DESCONTO DE DUPLICATAS',
            type:'LIMITES SICOOB',
            config:1,
            prazo_min: 12,
            prazo_max: 12,
            tax_max: 3.18,
            tax_min: 1.75
          },
          {
            name:'CRÉDITO EMPRESARIAL SICOOB CAPITAL DE GIRO ATÉ 365 DIAS',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'CRÉDITO EMPRESARIAL SICOOB CAPITAL DE GIRO ACIMA DE 365 DIAS',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'CRÉDITO EMPRESARIAL SICOOB GRT - RECEBIVEIS DE CARTÕES',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'CRÉDITO EMPRESARIAL SICOOB GRT - DUP PROPRIAS',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'CRÉDITO EMPRESARIAL SICOOB GRT - RECEBIVEIS DE COBRANÇA',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'CRÉDITO EMPRESARIAL SICOOB GRT - ALIENAÇÃO FIDUCIÁRIA',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'CRÉDITO EMPRESARIAL SICOOBGRT - NP RURAL',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'CRÉDITO EMPRESARIAL SICOOB 13º SALÁRIO',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'CRÉDITO EMPRESARIAL SICOOB HOT-MONEY',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'SICOOB FINANCIAMENTO DE VEÍCULOS LEVES - 0KM - 20% entrada',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'SICOOB FINANCIAMENTO DE VEÍCULOS LEVES - 0KM - 20% a 50% entrada',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'SICOOB FINANCIAMENTO DE VEÍCULOS LEVES - 0KM - 50% entrada',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'SICOOB FINANCIAMENTO VEÍCULOS LEVES - USADO ATÉ 10 ANOS - 20% entrada',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'SICOOB FINANCIAMENTO VEÍCULOS LEVES - USADO ATÉ 10 ANOS - 20% a 50%  entrada',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'SICOOB FINANCIAMENTO VEÍCULOS LEVES - USADO ATÉ 10 ANOS - 50% entrada',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'SICOOB FINANCIAMENTO DE VEÍCULOS PESADOS - 0KM - 20% entrada',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'SICOOB FINANCIAMENTO DE VEÍCULOS PESADOS - 0KM - 20% a 50% entrada',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'SICOOB FINANCIAMENTO DE VEÍCULOS PESADOS - 0KM - 50% entrada',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'SICOOB FINANCIAMENTO DE VEÍCULOS PESADOS - USADOS - 20% entrada',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'SICOOB FINANCIAMENTO DE VEÍCULOS PESADOS - USADOS - 20% a 50% entrada',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'SICOOB FINANCIAMENTO DE VEÍCULOS PESADOS - USADOS - 50% entrada',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'SICOOB FINANCIAMENTO DE MOTOS - 0KM - 20% entrada',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'SICOOB FINANCIAMENTO DE MOTOS - 0KM - 20% a 50% entrada',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'SICOOB FINANCIAMENTO DE MOTOS - 0KM - 50% entrada',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'FINANC. SICOOB MATERIAL DE CONSTRUÇÃO',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'FINANC. SICOOB MÁQUINAS E EQUIPAMENTOS',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'FINANC. SICOOB MÓVEIS',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
          },
          {
            name:'FINANC. SICOOB - BENS E SERVIÇOS',
            type:'PRODUTOS DE CRÉDITO',
            config:1,
            prazo_min: 3,
            prazo_max: 30,
            tax_max: 20,
            tax_min: 2
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

criterios = [ {name: 'Reciprocidade de Pedras', value: 30},
              {name: 'Nota de Risco CRL',value: 20},
              {name: 'Score de Crédito',value: 30},
              {name: 'Garantias', value: 30}]
              

 csetups = [  {name: 'Topazio',                 value:0   ,fth:'Reciprocidade de Pedras'},
              {name: 'Safira',                  value:15  ,fth:'Reciprocidade de Pedras'},
              {name: 'Rubi',                    value:20  ,fth:'Reciprocidade de Pedras'},
              {name: 'Esmeralda',               value:40  ,fth:'Reciprocidade de Pedras'},
              {name: 'Diamante',                value:100 ,fth:'Reciprocidade de Pedras'},
              {name: 'R13 - R15',               value:0   ,fth:'Nota de Risco CRL'},
              {name: 'R12 - R10',               value:30  ,fth:'Nota de Risco CRL'},
              {name: 'R9 - R7',                 value:70  ,fth:'Nota de Risco CRL'},
              {name: 'Menor que R6',            value:100  ,fth:'Nota de Risco CRL'},
              {name: '351 à 450',               value:20   ,fth:'Score de Crédito'},
              {name: '451 à 600',               value:60  ,fth:'Score de Crédito'},
              {name: '601 à 750',               value:80  ,fth:'Score de Crédito'},
              {name: '>751',                    value:100  ,fth:'Score de Crédito'},
              {name: 'Sem garantia',            value:0   ,fth:'Garantias'},
              {name: 'Aval de Terceiros',       value:10  ,fth:'Garantias'},
              {name: 'Cobrança',                value:10  ,fth:'Garantias'},
              {name: 'Alienação de Veículos',   value:20  ,fth:'Garantias'},
              {name: 'Alienação de Otros bens', value:20  ,fth:'Garantias'},
              {name: 'Hipoteca',                value:15  ,fth:'Garantias'},
              {name: 'Aplicação Financeira',    value:20  ,fth:'Garantias'},
              {name: 'Seguro',                  value:10  ,fth:'Garantias'}
]


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
  csetups.real_value = ((sstup[:value] *  CriteriaImpactDefinition.where(criterium_id: csetups.criterium_id).last.impact) / 100)
  csetups.save
end

