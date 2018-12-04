puts 'iniciando SEED SEED SEED'

FileType.create!(name: 'Padrão', description: 'Defalt Description')
FileType.create!(name: 'Formulários', description: 'Defalt Description')
FileType.create!(name: 'Manuais', description: 'Defalt Description')
FileType.create!(name: 'Outros', description: 'Defalt Description') 

fotoname = [ 'hero.jpg', 'loop.jpg', 'nat-1.jpg', 'nat-2.jpg',
             'nat-3.jpg', 'nat-4.jpg', 'nat-5.jpg', 'soft.jpg'
            ]

fotoname.each do |i|
  temp = Post.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph(5)
  )   
  temp.image.attach(
    io: File.open("public/img/#{i}"), 
    filename: i, content_type: 'image/jpg'
    )
end

puts 'Criando usuário padrão'
User.create(  
    full_name: 'Administrador Padrão',
    login: 'admin',
    birthday: Faker::Date.birthday(18, 65),
    role: 0,
    site_location: 0,
    email: 'teste@teste.com', 
    password: '123456',
    password_confirmation: '123456',
    kind: 0
  )
puts 'usuário padrão Criado '

#puts 'Cirando usuários de teste'
#50.times do
#  User.create(
#    full_name: Faker::Name.name,
#    login: Faker::Internet.user_name,
#    birthday: Faker::Date.birthday(18, 65),
#    role: [0,1,2,4,5,6,7,8,9,10].sample,
#    site_location: [0,1,2,4].sample,
#    email:Faker::Internet.email, 
#    role: [0, 1, 2, 4, 5, 6, 7, 8, 9, 10].sample,
#    site_location: [0, 1, 2, 4].sample,
#    email: Faker::Internet.email,
#    password: '123456',
#    password_confirmation: '123456', 
#    kind: [0, 1, 2].sample
#  )
#end




puts 'cadastrando tipos de credito'

tipos = [ 'Linhas de crédito pessoa física',
          'LINHAS DE CRÉDITO PRÉ APROVADA',
          'LINHAS DE CRÉDITO PESSOA JURÍDICA',
          'LINHAS DE CRÉDITO RURAL RECURSOS PRÓPRIOS',
          'LINHAS ESPECIAIS PARA FINANCIAMENTO',
          'CRÉDITO CONSIGNADO PARA FUNCIONÁRIOS SICOOB CREDICOPE'          
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
            name: 'Adiantamento à depositante (R$30,00 Por Acatamento)',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 1,
            prazo_max: 1,
            tax_max: 19,
            tax_min: 19
          },
          { name: 'SICOOBCRED CHEQUE ESPECIAL - SEM GARANTIA',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 1,
            prazo_max: 1,
            tax_max: 6.9,
            tax_min: 6.9
          },
          { name: 'SICOOBCRED CHEQUE ESPECIAL - COM GARANTIA',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 1,
            prazo_max: 1,
            tax_max: 4.45,
            tax_min: 4.45
          },
          { name: 'SICOOBCRED - PARCELAMENTO CHEQUE ESPECIAL E CARTÃO DE CRÉDITO - COM GARANTIA (DE 1 À 12 MESES)',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 1,
            prazo_max: 12,
            tax_max: 3.19,
            tax_min: 3.0
          },
          { name: 'SICOOBCRED - PARCELAMENTO CHEQUE ESPECIAL E CARTÃO DE CRÉDITO - COM GARANTIA (DE 13 À 24 MESES)',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 13,
            prazo_max: 24,
            tax_max: 3.39,
            tax_min: 3.20
          },
          { name: 'SICOOBCRED - PARCELAMENTO CHEQUE ESPECIAL E CARTÃO DE CRÉDITO - COM GARANTIA (DE 25 À 36 MESES)',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 3.59,
            tax_min: 3.40
          },
          { name: 'SICOOBCRED - PARCELAMENTO CHEQUE ESPECIAL E CARTÃO DE CRÉDITO - COM GARANTIA (DE 37 À 48 MESES)',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 3.79,
            tax_min: 3.60
          },
          { name: 'SICOOBCRED - PARCELAMENTO CHEQUE ESPECIAL E CARTÃO DE CRÉDITO - SEM GARANTIA (DE 1 À 12 MESES)',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 1,
            prazo_max: 12,
            tax_max: 4.19,
            tax_min: 4.00
          },
          { name: 'SICOOBCRED - PARCELAMENTO CHEQUE ESPECIAL E CARTÃO DE CRÉDITO - SEM GARANTIA (DE 13 À 24 MESES)',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 13,
            prazo_max: 24,
            tax_max: 4.39,
            tax_min: 4.20
          },
          { name: 'SICOOBCRED - PARCELAMENTO CHEQUE ESPECIAL E CARTÃO DE CRÉDITO - SEM GARANTIA (DE 25 À 36 MESES)',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 4.59,
            tax_min: 4.49
          },
          { name: 'SICOOBCRED - PARCELAMENTO CHEQUE ESPECIAL E CARTÃO DE CRÉDITO - SEM GARANTIA (DE 37 À 48 MESES)',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 4.79,
            tax_min: 4.60
          },
          { name: 'SICOOB CDA SIMPLES - FLEXIBILIDADE NAS PARCELAS',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 2,
            prazo_max: 36,
            tax_max: 2.99,
            tax_min: 2.70
          },
          { name: 'SICOOB CDA SIMPLES - APENAS PARCELAS MENSAIS',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 2,
            prazo_max: 48,
            tax_max: 2.99,
            tax_min: 2.70
          },
          { name: 'SICOOB CDA SIMPLES COM ALIENAÇAO DE VEICULO - GARANTIA DE ALIENAÇAO VEICULO PROPRIO (DE 2 À 12 MESES)',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 2,
            prazo_max: 12,
            tax_max: 1.68,
            tax_min: 1.49
          },
          { name: 'SICOOB CDA SIMPLES COM ALIENAÇAO DE VEICULO - GARANTIA DE ALIENAÇAO VEICULO PROPRIO (DE 13 À 24 MESES)',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 13,
            prazo_max: 24,
            tax_max: 2.19,
            tax_min: 2
          },
          { name: 'SICOOB CDA SIMPLES COM ALIENAÇAO DE VEICULO - GARANTIA DE ALIENAÇAO VEICULO PROPRIO (DE 25 À 36 MESES)',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 2.39,
            tax_min: 2.20
          },
          { name: 'SICOOB CDA SIMPLES COM ALIENAÇAO DE VEICULO - GARANTIA DE ALIENAÇAO VEICULO PROPRIO (DE 37 À 48 MESES)',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 2.59,
            tax_min: 2.40
          },
          { name: 'SICOOBCRED ESPECIAL',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 2,
            prazo_max: 48,
            tax_max: 0.79,
            tax_min: 0.79
          },
          { name: 'SICOOBCRED DESCONTO DE CHEQUES',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 5,
            prazo_max: 180,
            tax_max: 2,
            tax_min: 1.81
          },
          { name: 'SICOOBCRED DESCONTO DE DUPLICATAS',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 5,
            prazo_max: 180,
            tax_max: 2,
            tax_min: 1.81
          },
          { name: 'ANTECIPAÇÃO DE RECEBÍVEIS',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 1,
            prazo_max: 1,
            tax_max: 1.49,
            tax_min: 1.30
          },
          { name: 'SICOOBCRED MÓVEIS, ELETRODOMESTICOS E COMPUTADORES - EMPRESA ASSOCIADA',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 2,
            prazo_max: 24,
            tax_max: 1.98,
            tax_min: 1.79
          },
          { name: 'SICOOBCRED MÓVEIS, ELETRODOMESTICOS E COMPUTADORES - EMPRESA NÃO ASSOCIADA',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 2,
            prazo_max: 24,
            tax_max: 2.39,
            tax_min: 2.20
          },
          { name: 'SICOOBCRED MÁQUINAS E EQUIPAMENTOS / MATERIAL DE CONSTRUÇÃO - EMPRESA ASSOCIADA (DE 2 À 36)',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 2,
            prazo_max: 36,
            tax_max: 1.98,
            tax_min: 1.79
          },
          { name: 'SICOOBCRED MÁQUINAS E EQUIPAMENTOS / MATERIAL DE CONSTRUÇÃO - EMPRESA ASSOCIADA (DE 37 À 48)',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 2.10,
            tax_min: 1.91
          },
          { name: 'SICOOBCRED MÁQUINAS E EQUIPAMENTOS / MATERIAL DE CONSTRUÇÃO - EMPRESA ASSOCIADA (DE 49 À 60)',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 49,
            prazo_max: 60,
            tax_max: 2.50,
            tax_min: 2.31
          },
          { name: 'SICOOBCRED MÁQUINAS E EQUIPAMENTOS / MATERIAL DE CONSTRUÇÃO - EMPRESA NÃO ASSOCIADA',
            type: 'Linhas de crédito pessoa física',
            config: 0,
            prazo_min: 2,
            prazo_max: 36,
            tax_max: 2.39,
            tax_min: 2.20
          },
          { name: 'SICOOBCRED LEÃO PRÉ APROVADA',
            type: 'LINHAS DE CRÉDITO PRÉ APROVADA',
            config: 0,
            prazo_min: 1,
            prazo_max: 8,
            tax_max: 2.20,
            tax_min: 2.01
          },
          { name: 'SICOOBCRED SIMPLES - PRÉ APROVADO (DE 3 À 12 MESES)',
            type: 'LINHAS DE CRÉDITO PRÉ APROVADA',
            config: 0,
            prazo_min: 3,
            prazo_max: 12,
            tax_max: 3.99,
            tax_min: 3.80
          },
          { name: 'SICOOBCRED SIMPLES - PRÉ APROVADO (DE 13 À 24 MESES)',
            type: 'LINHAS DE CRÉDITO PRÉ APROVADA',
            config: 0,
            prazo_min: 13,
            prazo_max: 24,
            tax_max: 4.49,
            tax_min: 4.30
          },
          { name: 'SICOOBCRED SIMPLES - PRÉ APROVADO (DE 25 À 36 MESES)',
            type: 'LINHAS DE CRÉDITO PRÉ APROVADA',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 4.99,
            tax_min: 4.80
          },
          { name: 'SICOOBCRED SIMPLES - PRÉ APROVADO PJ - MEI, Deverá ter análise técnica (DE 03 À 12 MESES)',
            type: 'LINHAS DE CRÉDITO PRÉ APROVADA',
            config: 0,
            prazo_min: 3,
            prazo_max: 12,
            tax_max: 2.30,
            tax_min: 2.30
          },
          { name: 'SICOOBCRED SIMPLES - PRÉ APROVADO PJ - MEI, Deverá ter análise técnica (DE 13 À 24 MESES)',
            type: 'LINHAS DE CRÉDITO PRÉ APROVADA',
            config: 0,
            prazo_min: 13,
            prazo_max: 24,
            tax_max: 2.49,
            tax_min: 2.49
          },
          { name: 'SICOOBCRED SIMPLES - PRÉ APROVADO PJ - MEI, Deverá ter análise técnica (DE 25 À 36 MESES)',
            type: 'LINHAS DE CRÉDITO PRÉ APROVADA',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 2.59,
            tax_min: 2.59
          },
          { name: 'ADIANTAMENTO A DEPOSITANTE (R$30,00 POR ACATAMENTO)',
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 19,
            tax_min: 19
          },
          { name: 'SICOOBCRED CONTA GARANTIDA',
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 1,
            prazo_max: 1,
            tax_max: 3.59,
            tax_min: 3.59
          },
          { name: 'SICOOBCRED PARCELAMENTO CONTA GARANTIDA (DE 01 À 12 MESES)',
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 1,
            prazo_max: 12,
            tax_max: 3.49,
            tax_min: 3.30
          },
          { name: 'SICOOBCRED PARCELAMENTO CONTA GARANTIDA (DE 13 À 24 MESES)',
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 13,
            prazo_max: 24,
            tax_max: 3.59,
            tax_min: 3.40
          },
          { name: 'SICOOBCRED PARCELAMENTO CONTA GARANTIDA (DE 25 À 36 MESES)',
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 3.69,
            tax_min: 3.50
          },
          { name: 'SICOOBCRED PARCELAMENTO CONTA GARANTIDA (DE 37 À 48 MESES)',
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 3.79,
            tax_min: 3.60
          },
          { name: 'SICOOBCRED PARCELAMENTO CONTA GARANTIDA - GARANTIA REAL E/OU SGC (DE 1 À 12 MESES)',
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 1,
            prazo_max: 12,
            tax_max: 2.89,
            tax_min: 2.70
          },
          { name: 'SICOOBCRED PARCELAMENTO CONTA GARANTIDA - GARANTIA REAL E/OU SGC (DE 13 À 24 MESES)',
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 13,
            prazo_max: 24,
            tax_max: 2.99,
            tax_min: 2.8
          },
          { name: 'SICOOBCRED PARCELAMENTO CONTA GARANTIDA - GARANTIA REAL E/OU SGC (DE 25 À 36 MESES)',
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 3.09,
            tax_min: 2.90
          },
          { name: 'SICOOBCRED PARCELAMENTO CONTA GARANTIDA - GARANTIA REAL E/OU SGC (DE 37 À 48 MESES)',
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 3.19,
            tax_min: 3.00
          },
          { name: 'SICOOBCRED CDA SIMPLES - PRÉ FIXADO',
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 2,
            prazo_max: 36,
            tax_max: 2,
            tax_min: 1.81
          },
          { name: 'SICOOBCRED ESPECIAL',
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 2,
            prazo_max: 36,
            tax_max: 1,
            tax_min: 1
          },
          { name: 'SICOOBCRED CAPITAL DE GIRO - PGTO ÚNICO',
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 1,
            prazo_max: 6,
            tax_max: 2.50,
            tax_min: 2.31
          },
          { name: 'SICOOBCRED CAPITAL DE GIRO - PARCELADO (DE 01 À 12 MESES)' ,
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 1,
            prazo_max: 12,
            tax_max: 1.80,
            tax_min: 1.61
          },
          { name: 'SICOOBCRED CAPITAL DE GIRO - PARCELADO (DE 12 À 24 MESES)' ,
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 12,
            prazo_max: 24,
            tax_max: 1.99,
            tax_min: 1.80
          },
          { name: 'SICOOBCRED CAPITAL DE GIRO - PARCELADO (DE 25 À 36 MESES)' ,
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 2,
            tax_min: 1.81
          },
          { name: 'SICOOBCRED CAPITAL DE GIRO - PARCELADO COM GARANTIA DA SCG (DE 1 À 12 MESES)' ,
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 1,
            prazo_max: 12,
            tax_max: 1.7,
            tax_min: 1.5
          },
          { name: 'SICOOBCRED CAPITAL DE GIRO - PARCELADO COM GARANTIA DA SCG (DE 13 À 24 MESES)' ,
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 13,
            prazo_max: 24,
            tax_max: 1.9,
            tax_min: 1.7
          },
          { name: 'SICOOBCRED CAPITAL DE GIRO - PARCELADO COM GARANTIA DA SCG (DE 25 À 36 MESES)' ,
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 2,
            tax_min: 1.80
          },
          { name: 'SICOOBCRED CAPITAL DE GIRO - 13 SALARIO' ,
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 1,
            prazo_max: 12,
            tax_max: 1.8,
            tax_min: 1.61
          },
          { name: 'SICOOBCRED ROTATIVO (GARANTIA REAL)' ,
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 1,
            prazo_max: 1,
            tax_max: 1.99,
            tax_min: 1.81
          },
          { name: 'SICOOBCRED ROTATIVO (NÃO TER SEM CONTA GARANTIDA)' ,
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 1,
            prazo_max: 1,
            tax_max: 2.20,
            tax_min: 2.10
          },
          { name: 'SICOOBCRED DESCONTOS DE CHEQUES (ATÉ R$10.000,00)' ,
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 5,
            prazo_max: 180,
            tax_max: 1.8,
            tax_min: 1.61
          },
          { name: 'SICOOBCRED DESCONTOS DE CHEQUES (DE R$10.000,01 À 50.000,00)' ,
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 5,
            prazo_max: 180,
            tax_max: 1.59,
            tax_min: 1.4
          },
          { name: 'SICOOBCRED DESCONTOS DE CHEQUES (ACIMA DE 50.000,00)' ,
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 5,
            prazo_max: 180,
            tax_max: 1.49,
            tax_min: 1.30
          },
          { name: 'SICOOBCRED DESCONTOS DE DUPLICATAS' ,
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 5,
            prazo_max: 180,
            tax_max: 1.80,
            tax_min: 1.61
          },
          { name: 'SICOOBCRED ANTECIPAÇÃO DE RECEBÍVEIS' ,
            type: 'LINHAS DE CRÉDITO PESSOA JURÍDICA',
            config: 1,
            prazo_min: 1,
            prazo_max: 1,
            tax_max: 1.49,
            tax_min: 1.30
          },
          { name: 'CUSTEIO' ,
            type: 'LINHAS DE CRÉDITO RURAL RECURSOS PRÓPRIOS',
            config: 0,
            prazo_min: 1,
            prazo_max: 12,
            tax_max: 0.95,
            tax_min: 0.95
          },
          { name: 'INVESTIMENTO' ,
            type: 'LINHAS DE CRÉDITO RURAL RECURSOS PRÓPRIOS',
            config: 0,
            prazo_min: 1,
            prazo_max: 48,
            tax_max: 1.25,
            tax_min: 1.25
          },
          { name: 'CUSTEIO SGC' ,
            type: 'LINHAS DE CRÉDITO RURAL RECURSOS PRÓPRIOS',
            config: 0,
            prazo_min: 1,
            prazo_max: 12,
            tax_max: 0.90,
            tax_min: 0.90
          },
          { name: 'INVESTIMENTO SGC' ,
            type: 'LINHAS DE CRÉDITO RURAL RECURSOS PRÓPRIOS',
            config: 0,
            prazo_min: 1,
            prazo_max: 48,
            tax_max: 1.20,
            tax_min: 1.20
          },
          { name: 'SICOOB RURAL ESPECIAL - PF (CONFORME ENQUADRAMENTO CUSTEIO/INVESTIMENTO)' ,
            type: 'LINHAS DE CRÉDITO RURAL RECURSOS PRÓPRIOS',
            config: 0,
            prazo_min: 1,
            prazo_max: 48,
            tax_max: 0.79,
            tax_min: 0.79
          },
          { name: 'SICOOB RURAL ESPECIAL - PJ (CONFORME ENQUADRAMENTO CUSTEIO/INVESTIMENTO)' ,
            type: 'LINHAS DE CRÉDITO RURAL RECURSOS PRÓPRIOS',
            config: 1,
            prazo_min: 1,
            prazo_max: 48,
            tax_max: 1,
            tax_min: 1
          },
          { name: 'SICOOBCRED VEÍCULOS LEVES NOVOS - SEM ENTRADA (DE 02 A 12 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 2,
            prazo_max: 12,
            tax_max: 1.25,
            tax_min: 1.06
          },
          { name: 'SICOOBCRED VEÍCULOS LEVES NOVOS - SEM ENTRADA (DE 13 A 24 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 13,
            prazo_max: 24,
            tax_max: 1.35,
            tax_min: 1.16
          },
          { name: 'SICOOBCRED VEÍCULOS LEVES NOVOS - SEM ENTRADA (DE 25 A 36 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 1.45,
            tax_min: 1.26
          },
          { name: 'SICOOBCRED VEÍCULOS LEVES NOVOS - SEM ENTRADA (DE 37 A 48 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 1.55,
            tax_min: 1.36
          },
          { name: 'SICOOBCRED VEÍCULOS LEVES NOVOS - SEM ENTRADA (DE 49 A 60 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 49,
            prazo_max: 60,
            tax_max: 1.65,
            tax_min: 1.46
          },
          { name: 'SICOOBCRED VEÍCULOS LEVES USADOS DE 1 À 36 MESES - ENTRADA MINIMA DE 10% (DE 2 A 12 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 2,
            prazo_max: 12,
            tax_max: 1.30,
            tax_min: 1.11
          },
          { name: 'SICOOBCRED VEÍCULOS LEVES USADOS DE 1 À 36 MESES - ENTRADA MINIMA DE 10% (DE 13 A 24 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 13,
            prazo_max: 24,
            tax_max: 1.4,
            tax_min: 1.21
          },
          { name: 'SICOOBCRED VEÍCULOS LEVES USADOS DE 1 À 36 MESES - ENTRADA MINIMA DE 10% (DE 25 A 36 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 1.5,
            tax_min: 1.31
          },
          { name: 'SICOOBCRED VEÍCULOS LEVES USADOS DE 1 À 36 MESES - ENTRADA MINIMA DE 10% (DE 37 A 48 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 1.6,
            tax_min: 1.41
          },
          { name: 'SICOOBCRED VEÍCULOS LEVES USADOS DE 1 À 36 MESES - ENTRADA MINIMA DE 10% (DE 49 A 60 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 49,
            prazo_max: 60,
            tax_max: 1.7,
            tax_min: 1.51
          },
          { name: 'SICOOBCRED VEÍCULOS LEVES USADOS ACIMA DE 36 MESES - ENTRADA MINIMA DE 20% (DE 2 A 12 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 2,
            prazo_max: 12,
            tax_max: 1.35,
            tax_min: 1.16
          },
          { name: 'SICOOBCRED VEÍCULOS LEVES USADOS ACIMA DE 36 MESES - ENTRADA MINIMA DE 20% (DE 13 A 24 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 13,
            prazo_max: 24,
            tax_max: 1.45,
            tax_min: 1.26
          },
          { name: 'SICOOBCRED VEÍCULOS LEVES USADOS ACIMA DE 36 MESES - ENTRADA MINIMA DE 20% (DE 25 A 36 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 1.55,
            tax_min: 1.36
          },
          { name: 'SICOOBCRED VEÍCULOS LEVES USADOS ACIMA DE 36 MESES - ENTRADA MINIMA DE 20% (DE 37 A 48 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 1.65,
            tax_min: 1.46
          },
          { name: 'SICOOBCRED VEÍCULOS LEVES CREDITO DIGITAL VEICULO ATÉ 10 ANOS - ENTRADA MINIMA DE 30% (DE 2 A 12 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 2,
            prazo_max: 12,
            tax_max: 1.30,
            tax_min: 1.30
          },
          { name: 'SICOOBCRED VEÍCULOS LEVES CREDITO DIGITAL VEICULO ATÉ 10 ANOS - ENTRADA MINIMA DE 30% (DE 13 A 24 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 13,
            prazo_max: 24,
            tax_max: 1.40,
            tax_min: 1.40
          },
          { name: 'SICOOBCRED VEÍCULOS LEVES CREDITO DIGITAL VEICULO ATÉ 10 ANOS - ENTRADA MINIMA DE 30% (DE 25 A 36 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 1.50,
            tax_min: 1.50
          },
          { name: 'SICOOBCRED VEÍCULOS LEVES CREDITO DIGITAL VEICULO ATÉ 10 ANOS - ENTRADA MINIMA DE 30% (DE 37 A 48 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 1.60,
            tax_min: 1.60
          },
          { name: 'SICOOBCRED VEÍCULOS LEVES CREDITO DIGITAL VEICULO ATÉ 10 ANOS - ENTRADA MINIMA DE 30% (DE 49 A 60 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 49,
            prazo_max: 60,
            tax_max: 1.70,
            tax_min: 1.70
          },
          { name: 'SICOOBCRED VEÍCULOS PESADOS NOVOS - 10% Á 30% DE ENTRADA (DE 2 A 24 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 2,
            prazo_max: 24,
            tax_max: 1.75,
            tax_min: 1.50
          },
          { name: 'SICOOBCRED VEÍCULOS PESADOS NOVOS - 10% Á 30% DE ENTRADA (DE 25 A 36 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 1.85,
            tax_min: 1.60
          },
          { name: 'SICOOBCRED VEÍCULOS PESADOS NOVOS - 10% Á 30% DE ENTRADA (DE 37 A 48 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 1.95,
            tax_min: 1.70
          },
          { name: 'SICOOBCRED VEÍCULOS PESADOS NOVOS - 10% Á 30% DE ENTRADA (DE 49 A 60 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 49,
            prazo_max: 60,
            tax_max: 2.40,
            tax_min: 2.15
          },
          { name: 'SICOOBCRED VEÍCULOS PESADOS NOVOS - ACIMA DE 30% DE ENTRADA (DE 2 A 24 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 2,
            prazo_max: 24,
            tax_max: 1.65,
            tax_min: 1.40
          },
          { name: 'SICOOBCRED VEÍCULOS PESADOS NOVOS - ACIMA DE 30% DE ENTRADA (DE 25 A 36 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 1.75,
            tax_min: 1.50
          },
          { name: 'SICOOBCRED VEÍCULOS PESADOS NOVOS - ACIMA DE 30% DE ENTRADA (DE 37 A 48 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 1.85,
            tax_min: 1.60
          },
          { name: 'SICOOBCRED VEÍCULOS PESADOS NOVOS - ACIMA DE 30% DE ENTRADA (DE 49 A 60 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 49,
            prazo_max: 60,
            tax_max: 2.20,
            tax_min: 1.95
          },
          { name: 'SICOOBCRED VEÍCULOS PESADOS USADOS DE 0 À 5 ANOS COM 10 Á 30% DE ENTRADA (DE 2 A 24 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 2,
            prazo_max: 24,
            tax_max: 1.85,
            tax_min: 1.60
          },
          { name: 'SICOOBCRED VEÍCULOS PESADOS USADOS DE 0 À 5 ANOS COM 10 Á 30% DE ENTRADA (DE 25 A 36 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 2,
            tax_min: 1.75
          },
          { name: 'SICOOBCRED VEÍCULOS PESADOS USADOS DE 0 À 5 ANOS COM 10 Á 30% DE ENTRADA (DE 37 A 48 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 2.2,
            tax_min: 1.95
          },
          { name: 'SICOOBCRED VEÍCULOS PESADOS USADOS DE 0 À 5 ANOS COM 10 Á 30% DE ENTRADA (DE 49 A 60 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 49,
            prazo_max: 60,
            tax_max: 2.70,
            tax_min: 2.45
          },
          { name: 'SICOOBCRED VEÍCULOS PESADOS USADOS DE 5 À 10 ANOS COM ENTRADA ACIMA DE 30% (DE 2 A 24 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 2,
            prazo_max: 24,
            tax_max: 1.80,
            tax_min: 1.55
          },
          { name: 'SICOOBCRED VEÍCULOS PESADOS USADOS DE 5 À 10 ANOS COM ENTRADA ACIMA DE 30% (DE 25 A 36 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 1.90,
            tax_min: 1.65
          },
          { name: 'SICOOBCRED VEÍCULOS PESADOS USADOS DE 5 À 10 ANOS COM ENTRADA ACIMA DE 50% (DE 37 A 48 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 2.10,
            tax_min: 1.85
          },
          { name: 'SICOOBCRED RENOVAR - USINA DE ENERGIA SOLAR (DE 1 A 24 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 1,
            prazo_max: 24,
            tax_max: 1.08,
            tax_min: 1.08
          },
          { name: 'SICOOBCRED RENOVAR - USINA DE ENERGIA SOLAR (DE 25 A 36 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 1.16,
            tax_min: 1.16
          },
          { name: 'SICOOBCRED RENOVAR - USINA DE ENERGIA SOLAR (DE 37 A 60 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 37,
            prazo_max: 60,
            tax_max: 1.25,
            tax_min: 1.25
          },
          { name: 'CRÉDITO CONSIGNADO, FUNCIONÁRIOS (DE 3 A 17 MESES)',
            type: 'CRÉDITO CONSIGNADO PARA FUNCIONÁRIOS SICOOB CREDICOPE',
            config: 0,
            prazo_min: 3,
            prazo_max: 17,
            tax_max: 1.15,
            tax_min: 1.15
          },
          { name: 'CRÉDITO CONSIGNADO, FUNCIONÁRIOS (DE 18 A 24 MESES)',
            type: 'CRÉDITO CONSIGNADO PARA FUNCIONÁRIOS SICOOB CREDICOPE',
            config: 0,
            prazo_min: 18,
            prazo_max: 24,
            tax_max: 1.20,
            tax_min: 1.20
          },
          { name: 'CRÉDITO CONSIGNADO, FUNCIONÁRIOS (DE 35 A 36 MESES)',
            type: 'CRÉDITO CONSIGNADO PARA FUNCIONÁRIOS SICOOB CREDICOPE',
            config: 0,
            prazo_min: 35,
            prazo_max: 36,
            tax_max: 1.25,
            tax_min: 1.25
          },
          { name: 'CRÉDITO CONSIGNADO, FUNCIONÁRIOS (DE 37 A 48 MESES)',
            type: 'CRÉDITO CONSIGNADO PARA FUNCIONÁRIOS SICOOB CREDICOPE',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 1.35,
            tax_min: 1.35
          },
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

 csetups = [{ name: 'Topazio',                 value: 0   ,fth: 'Reciprocidade de Pedras'},
            { name: 'Safira',                  value: 15  ,fth: 'Reciprocidade de Pedras'},
            { name: 'Rubi',                    value: 20  ,fth: 'Reciprocidade de Pedras'},
            { name: 'Esmeralda',               value: 40  ,fth: 'Reciprocidade de Pedras'},
            { name: 'Diamante',                value: 100 ,fth: 'Reciprocidade de Pedras'},
            { name: '> R8',                    value: 0   ,fth: 'Nota de Risco CRL'},
            { name: 'R5 - R7',                 value: 30  ,fth: 'Nota de Risco CRL'},
            { name: 'R4',                      value: 70  ,fth: 'Nota de Risco CRL'},
            { name: 'Menor que R3',            value: 100 ,fth: 'Nota de Risco CRL'},
            { name: '351 à 450',               value: 20  ,fth: 'Score de Crédito'},
            { name: '451 à 600',               value: 60  ,fth: 'Score de Crédito'},
            { name: '601 à 750',               value: 80  ,fth: 'Score de Crédito'},
            { name: '>751',                    value: 100 ,fth: 'Score de Crédito'},
            { name: 'Sem garantia',            value: 0   ,fth: 'Garantias'},
            { name: 'Aval de Terceiros',       value: 10  ,fth: 'Garantias'},
            { name: 'Cobrança',                value: 10  ,fth: 'Garantias'},
            { name: 'Alienação de Veículos',   value: 20  ,fth: 'Garantias'},
            { name: 'Alienação de Otros bens', value: 20  ,fth: 'Garantias'},
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
statuses = ['novo','em atendimento','pendente','aguardando atendimento','aguardando aprovação','finalizado']

statuses.each do |status|
    new_status = RequisitionStatus.new
    new_status.name = status
    new_status.save
end

categories = ['nova proposta']

categories.each do |category|
    new_category = RequisitionCategory.new
    new_category.name = category
    new_category.save
end

30.times do 
  Requisition.create(
    title: Faker::Lorem.sentence,    
    description: Faker::Lorem.paragraph(5),
    requisition_status_id: 1,
    requisition_category_id: 1,
    requester_id: User.all.sample.id,
    site_location: User.all.sample.site_location,
    flag: 0
  )
end

Requisition.all.each do |req|
 StatusAction.create(
  requisition_id: req.id,
  start: Time.now,
  requisition_status_id: req.requisition_status_id,                             
  action_by:  User.all.sample.login
 )
end