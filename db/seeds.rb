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
    login: 'teste3047-00',
    birthday: Faker::Date.birthday(18, 65),
    role: 0,
    site_location: 0,
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
    role: [0, 1, 2, 4, 5, 6, 7, 8, 9, 10].sample,
    site_location: [0, 1, 2, 4].sample,
    email: Faker::Internet.email,
    password: '123456',
    password_confirmation: '123456',
    kind: [0, 1, 2].sample
  )
end

puts 'cadastrando tipos de credito'

tipos = ['PRÉ-APROVADO SICOOB',
          'LINHAS DE CRÉDITO PESSOA FÍSICA',
          'LINHAS DE CRÉDITO RURAL RECURSOS PRÓPRIOS',
          'LINHAS ESPECIAIS PARA FINANCIAMENTO',
          'Linha de Crédito consignado para funcionarios SICOOB CREDICOPE',
          'PRODUTOS DE CRÉDITO']

tipos.each do |tipo|
  a = CreditType.new
  a.name = tipo
  a.description = tipo
  a.save
end

puts 'tipos de credito cadastrados'

puts 'Cadastrando Linhas de  credito'
lines = [{
            name: 'SICOOBCRED LEÃO PRÉ APROVADA',
            type: 'PRÉ-APROVADO SICOOB',
            config: 0,
            prazo_min: 1,
            prazo_max: 8,
            tax_max: 2.4,
            tax_min: 2.01
          },
          {
            name: 'SICOOBCRED SIMPLES - PRÉ APROVADO (DE 03 a 12 MESES)',
            type: 'PRÉ-APROVADO SICOOB',
            config: 0,
            prazo_min: 3,
            prazo_max: 12,
            tax_min: 3.80,
            tax_max: 3.99
          },
          {
            name: 'SICOOBCRED SIMPLES - PRÉ APROVADO (DE 13 a 24  MESES)',
            type: 'PRÉ-APROVADO SICOOB',
            config: 0,
            prazo_min: 13,
            prazo_max: 24,
            tax_max: 4.49,
            tax_min: 4.30
          },
          {
            name: 'SICOOBCRED SIMPLES - PRÉ APROVADO (DE 25 a 36  MESES)',
            type: 'PRÉ-APROVADO SICOOB',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 4.99,
            tax_min: 4.80
          },
          {
            name: 'ADIANTAMENTO A DEPOSITANTE (R$30,00 POR ACATAMENTO)',
            type: 'LINHAS DE CRÉDITO PESSOA FÍSICA',
            config: 0,
            prazo_min: 1,
            prazo_max: 1,
            tax_max: 19,
            tax_min: 19
          },
          {
            name: 'SICOOBCRED CHEQUE ESPECIAL - SEM GARANTIA',
            type: 'LINHAS DE CRÉDITO PESSOA FÍSICA',
            config: 0,
            prazo_min: 1,
            prazo_max: 1,
            tax_max: 6.9,
            tax_min: 6.9
          },
          {
            name: 'SICOOBCRED CHEQUE ESPECIAL - COM GARANTIA',
            type: 'LINHAS DE CRÉDITO PESSOA FÍSICA',
            config: 0,
            prazo_min: 1,
            prazo_max: 1,
            tax_max: 4.45,
            tax_min: 4.45
          },
          {
            name: 'SICOOBCRED CDA SIMPLES - FLEXIBILIDADE NAS PARCELAS',
            type: 'LINHAS DE CRÉDITO PESSOA FÍSICA',
            config: 0,
            prazo_min: 2,
            prazo_max: 36,
            tax_max: 2.99,
            tax_min: 2.5
          },
          {
            name: 'SICOOBCRED CDA SIMPLES - APENAS PARCELAS MENSAIS',
            type: 'LINHAS DE CRÉDITO PESSOA FÍSICA',
            config: 0,
            prazo_min: 2,
            prazo_max: 48,
            tax_max: 2.99,
            tax_min: 2.79
          },
          {
            name: 'SICOOBCRED CDA SIMPLES - AVALIAÇÃO PARA BLOQUEIO - POS FIXADO - CDI',
            type: 'LINHAS DE CRÉDITO PESSOA FÍSICA',
            config: 0,
            prazo_min: 2,
            prazo_max: 60,
            tax_max: 9.99,
            tax_min: 9.99
          },
          {
            name: 'SICOOBCRED ESPECIAL',
            type: 'LINHAS DE CRÉDITO PESSOA FÍSICA',
            config: 0,
            prazo_min: 2,
            prazo_max: 48,
            tax_max: 0.95,
            tax_min: 0.75
          },
          {
            name: 'SICOOBCRED DESCONTO DE CHEQUES',
            type: 'LINHAS DE CRÉDITO PESSOA FÍSICA',
            config: 0,
            prazo_min: 5,
            prazo_max: 180,
            tax_max: 2,
            tax_min: 1.81
          },
          {
            name: 'SICOOBCRED DESCONTO DE DUPLICATAS',
            type: 'LINHAS DE CRÉDITO PESSOA FÍSICA',
            config: 0,
            prazo_min: 5,
            prazo_max: 180,
            tax_max: 2,
            tax_min: 1.81
          },
          {
            name: 'SICOOBCRED ANTECIPAÇÃO DE RECEBÍVEIS',
            type: 'LINHAS DE CRÉDITO PESSOA FÍSICA',
            config: 0,
            prazo_min: 1,
            prazo_max: 1,
            tax_max: 1.49,
            tax_min: 1.30
          },
          {
            name: 'SICOOBCRED MÓVEIS, ELETRODOMÉSTICOS E COMPUTADORES - EMPRESA ASSOCIADA',
            type: 'LINHAS DE CRÉDITO PESSOA FÍSICA',
            config: 0,
            prazo_min: 2,
            prazo_max: 24,
            tax_max: 1.98,
            tax_min: 1.79
          },
          {
            name: 'SICOOBCRED MÓVEIS, ELETRODOMÉSTICOS E COMPUTADORES - EMPRESA NÃO ASSOCIADA',
            type: 'LINHAS DE CRÉDITO PESSOA FÍSICA',
            config: 0,
            prazo_min: 2,
            prazo_max: 24,
            tax_max: 2.39,
            tax_min: 2.20
          },
          {
            name: 'SICOOBCRED MÁQUINAS E EQUIPAENTOS / MATERIAL DE CONSTRUÇÃO - EMPRESA ASSOCIADA  (DE 02 a 36 MESES)',
            type: 'LINHAS DE CRÉDITO PESSOA FÍSICA',
            config: 0,
            prazo_min: 2,
            prazo_max: 36,
            tax_max: 1.98,
            tax_min: 1.79
          },
          {
            name: 'SICOOBCRED MÁQUINAS E EQUIPAENTOS / MATERIAL DE CONSTRUÇÃO - EMPRESA ASSOCIADA  (DE 37 a 48 MESES)',
            type: 'LINHAS DE CRÉDITO PESSOA FÍSICA',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 2.10,
            tax_min: 1.91
          },
          {
            name: 'SICOOBCRED MÁQUINAS E EQUIPAENTOS / MATERIAL DE CONSTRUÇÃO - EMPRESA ASSOCIADA  (DE 49 a 60 MESES)',
            type: 'LINHAS DE CRÉDITO PESSOA FÍSICA',
            config: 0,
            prazo_min: 49,
            prazo_max: 60,
            tax_max: 2.5,
            tax_min: 2.31
          },
          {
            name: 'SICOOBCRED MÁQUINAS E EQUIPAENTOS / MATERIAL DE CONSTRUÇÃO - EMPRESA NÃO ASSOCIADA ',
            type: 'PRODUTOS DE CRÉDITO',
            config: 0,
            prazo_min: 2,
            prazo_max: 36,
            tax_max: 2.39,
            tax_min: 2.20
          },
          {
            name: 'CRÉDITO RURAL RECURSOS PRÓPRIOS - CUSTEIO',
            type: 'LINHAS DE CRÉDITO RURAL RECURSOS PRÓPRIOS',
            config: 0,
            prazo_min: 1,
            prazo_max: 12,
            tax_max: 1.7,
            tax_min: 1.51
          },
          {
            name: 'CRÉDITO RURAL RECURSOS PRÓPRIOS - INVESTIMENTO',
            type: 'LINHAS DE CRÉDITO RURAL RECURSOS PRÓPRIOS',
            config:0,
            prazo_min: 1,
            prazo_max: 48,
            tax_max: 1.95,
            tax_min: 1.76
          },
          {
            name: 'CRÉDITO RURAL RECURSOS PRÓPRIOS - CUSTEIO SGC',
            type: 'LINHAS DE CRÉDITO RURAL RECURSOS PRÓPRIOS',
            config:0,
            prazo_min: 1,
            prazo_max: 12,
            tax_max: 1.65,
            tax_min: 1.46
          },
          {
            name: 'CRÉDITO RURAL RECURSOS PRÓPRIOS - INVESTIMENTO SGC',
            type: 'LINHAS DE CRÉDITO RURAL RECURSOS PRÓPRIOS',
            config:0,
            prazo_min: 1,
            prazo_max: 48,
            tax_max: 1.90,
            tax_min: 1.71
          },
          {
            name: 'SICOOB RURAL ESPECIAL - PF - Conforme enquadramento (custeio/investimento)',
            type: 'LINHAS DE CRÉDITO RURAL RECURSOS PRÓPRIOS',
            config:0,
            prazo_min: 1,
            prazo_max: 1,
            tax_max: 0.95,
            tax_min: 0.75
          },
          {
            name: 'SICOOBCRED MOTOS  NOVAS E USADAS - Acima 30% de Entrada  (DE 02 a 36 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 2,
            prazo_max: 36,
            tax_max: 2.65,
            tax_min: 2.46
          },
          {
            name: 'SICOOBCRED MOTOS  NOVAS E USADAS - Acima 30% de Entrada  (DE 13 a 24 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 13,
            prazo_max: 24,
            tax_max: 2.89,
            tax_min: 2.70
          },
          {
            name: 'SICOOBCRED MOTOS  NOVAS E USADAS - Acima 30% de Entrada  (DE 25 a 36 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 3.20,
            tax_min: 3.01
          },
          {
            name: 'SICOOBCRED MOTOS  NOVAS E USADAS - Acima 30% de Entrada  (DE 37 a 48 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 47,
            prazo_max: 58,
            tax_max: 3.55,
            tax_min: 3.36
          },
          {
            name: 'SICOOBCRED VEÍCULOS LEVES NOVOS - 10% a 30% de Entrada (DE 02 A 24 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 2,
            prazo_max: 24,
            tax_max: 1.8,
            tax_min: 1.55
          },
          {
            name: 'SICOOBCRED VEÍCULOS LEVES NOVOS - 10% a 30% de Entrada (DE 25 a 36  MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 1.90,
            tax_min: 1.65
          },
          {
            name: 'SICOOBCRED VEÍCULOS LEVES NOVOS - 10% a 30% de Entrada (DE 37 A 48 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 2.0,
            tax_min: 1.75
          },
          {
            name: 'SICOOBCRED VEÍCULOS LEVES NOVOS - ACIMA DE 30% DE ENTRADA (DE 2 A 24 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 2,
            prazo_max: 24,
            tax_max: 1.7,
            tax_min: 1.45
          },
          {
            name: 'SICOOBCRED VEÍCULOS LEVES NOVOS - ACIMA DE 30% DE ENTRADA (DE 25 A 36 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 1.80,
            tax_min: 1.55
          },
          {
            name: 'SICOOBCRED VEÍCULOS LEVES NOVOS - ACIMA DE 30% DE ENTRADA (DE 37 A 48 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 1.9,
            tax_min: 1.65
          },
          {
            name: 'SICOOBCRED VEÍCULOS LEVES USADOS -  0 a 5 anos - 10% a 30% de Entrada (DE 2 A 24 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 2,
            prazo_max: 24,
            tax_max: 1.9,
            tax_min: 1.65
          },
          {
            name: 'SICOOBCRED VEÍCULOS LEVES USADOS -  0 a 5 anos - 10% a 30% de Entrada (DE 25 A 36 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 2.2,
            tax_min: 1.75
          },
          {
            name: 'SICOOBCRED VEÍCULOS LEVES USADOS -  0 a 5 anos - 10% a 30% de Entrada (DE 37 A 48 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 2.10,
            tax_min: 1.85
          },
          {
            name: 'SICOOBCRED VEÍCULOS LEVES USADOS -  5 a 10 anos - ACIMA DE 30% DE ENTRADA (DE 2 A 24 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 2,
            prazo_max: 24,
            tax_max: 1.8,
            tax_min: 1.55
          },
          {
            name: 'SICOOBCRED VEÍCULOS LEVES USADOS -  5 a 10 anos - ACIMA DE 30% DE ENTRADA (DE 25 A 36 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 1.9,
            tax_min: 1.65
          },
          {
            name: 'SICOOBCRED VEÍCULOS LEVES USADOS -  5 a 10 anos - ACIMA DE 30% DE ENTRADA (DE 37 A 48 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 2,
            tax_min: 1.75
          },
          {
            name: 'SICOOBCRED VEÍCULOS PESADOS NOVOS - 10% a 30% de Entrada  (DE 02 A 24 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 2,
            prazo_max: 24,
            tax_max: 1.75,
            tax_min: 1.5
          },
          {
            name: 'SICOOBCRED VEÍCULOS PESADOS NOVOS - 10% a 30% de Entrada  (DE 25 A 36 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 1.85,
            tax_min: 1.6
          },
          {
            name: 'SICOOBCRED VEÍCULOS PESADOS NOVOS - 10% a 30% de Entrada  (DE 37 A 48 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 1.95,
            tax_min: 1.70
          },
          {
            name: 'SICOOBCRED VEÍCULOS PESADOS NOVOS - 10% a 30% de Entrada  (DE 49 A 60 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 49,
            prazo_max: 60,
            tax_max: 2.40,
            tax_min: 2.15
          },
          {
            name: 'SICOOBCRED VEÍCULOS PESADOS NOVOS - ACIMA DE 30% DE ENTRADA  (DE 02 A 24 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 2,
            prazo_max: 24,
            tax_max: 1.65,
            tax_min: 1.40
          },
          {
            name: 'SICOOBCRED VEÍCULOS PESADOS NOVOS - ACIMA DE 30% DE ENTRADA  (DE 25 A 36 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 1.75,
            tax_min: 1.50
          },
          {
            name: 'SICOOBCRED VEÍCULOS PESADOS NOVOS - ACIMA DE 30% DE ENTRADA  (DE 37 A 48 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 1.85,
            tax_min: 1.60
          },
          {
            name: 'SICOOBCRED VEÍCULOS PESADOS NOVOS - ACIMA DE 30% DE ENTRADA  (DE 49 A 60 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 49,
            prazo_max: 60,
            tax_max: 2.20,
            tax_min: 1.95
          },
          {
            name: 'SICOOBCRED VEÍCULOS PESADOS USADOS - 0 a 5 anos  10% a 30% de Entrada (DE 02 A 24 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 2,
            prazo_max: 24,
            tax_max: 1.84,
            tax_min: 1.60
          },
          {
            name: 'SICOOBCRED VEÍCULOS PESADOS USADOS - 0 a 5 anos  10% a 30% de Entrada (DE 25 A 36 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 2,
            tax_min: 1.75
          },
          {
            name: 'SICOOBCRED VEÍCULOS PESADOS USADOS - 0 a 5 anos  10% a 30% de Entrada (DE 37 A 48 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 2.20,
            tax_min: 1.95
          },
          {
            name: 'SICOOBCRED VEÍCULOS PESADOS USADOS - 0 a 5 anos  10% a 30% de Entrada (DE 49 A 60 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 49,
            prazo_max: 60,
            tax_max: 2.7,
            tax_min: 2.45
          },
          {
            name: 'SICOOBCRED VEÍCULOS PESADOS USADOS - 5 a 10 anos ACIMA DE 30% DE ENTRADA  (DE 2 A 24 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 2,
            prazo_max: 24,
            tax_max: 1.80,
            tax_min: 1.55
          },
          {
            name: 'SICOOBCRED VEÍCULOS PESADOS USADOS - 5 a 10 anos ACIMA DE 30% DE ENTRADA  (DE 25 A 36 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 1.90,
            tax_min: 1.65
          },
          {
            name: 'SICOOBCRED VEÍCULOS PESADOS USADOS - 5 a 10 anos ACIMA DE 30% DE ENTRADA  (DE 37 A 48 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 2.10,
            tax_min: 1.85
          },
          {
            name: 'SICOOBCRED VEÍCULOS PESADOS USADOS - 5 a 10 anos ACIMA DE 30% DE ENTRADA  (DE 49 A 60 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 49,
            prazo_max: 60,
            tax_max: 2.40,
            tax_min: 2.15
          },
          {
            name: 'SICOOBCRED VEÍCULOS PESADOS USADOS - 10 a 20 anos ACIMA DE 50% DE ENTRADA  (DE 2 A 24 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 2,
            prazo_max: 24,
            tax_max: 1.80,
            tax_min: 1.55
          },
          {
            name: 'SICOOBCRED VEÍCULOS PESADOS USADOS - 10 a 20 anos ACIMA DE 50% DE ENTRADA  (DE 25 A 36 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 1.90,
            tax_min: 1.65
          },
          {
            name: 'SICOOBCRED VEÍCULOS PESADOS USADOS - 10 a 20 anos ACIMA DE 50% DE ENTRADA  (DE 37 A 48 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 2.10,
            tax_min: 1.85
          },
          {
            name: 'SICOOBCRED VEÍCULOS PESADOS USADOS - 10 a 20 anos ACIMA DE 50% DE ENTRADA  (DE 49 A 60 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 49,
            prazo_max: 60,
            tax_max: 2.40,
            tax_min: 2.15
          },
          {
            name: 'SICOOB RENOVAR - USINA DE ENERGIA SOLAR  (DE 1 a 24 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 1,
            prazo_max: 24,
            tax_max: 1.08,
            tax_min: 1.08
          },
          {
            name: 'SICOOB RENOVAR - USINA DE ENERGIA SOLAR  (DE 25 a 36 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 1.16,
            tax_min: 1.16
          },
          {
            name: 'SICOOB RENOVAR - USINA DE ENERGIA SOLAR  (DE 37 a 60 MESES)',
            type: 'LINHAS ESPECIAIS PARA FINANCIAMENTO',
            config: 0,
            prazo_min: 37,
            prazo_max: 60,
            tax_max: 1.25,
            tax_min: 1.25
          },
          {
            name: 'CRÉDITO CONSIGNADO, FUNCIONÁRIOS (DE 3 a 17 MESES)',
            type: 'Linha de Crédito consignado para funcionarios SICOOB CREDICOPE',
            config: 0,
            prazo_min: 3,
            prazo_max: 17,
            tax_max: 1.30,
            tax_min: 1.30
          },
          {
            name: 'CRÉDITO CONSIGNADO, FUNCIONÁRIOS (DE 18 a 24 MESES)',
            type: 'Linha de Crédito consignado para funcionarios SICOOB CREDICOPE',
            config: 0,
            prazo_min: 18,
            prazo_max: 24,
            tax_max: 1.35,
            tax_min: 1.35
          },
          {
            name: 'CRÉDITO CONSIGNADO, FUNCIONÁRIOS (DE 25 a 36 MESES)',
            type: 'Linha de Crédito consignado para funcionarios SICOOB CREDICOPE',
            config: 0,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 1.40,
            tax_min: 1.40
          },
          {
            name: 'CRÉDITO CONSIGNADO, FUNCIONÁRIOS (DE 27 a 48 MESES)',
            type: 'Linha de Crédito consignado para funcionarios SICOOB CREDICOPE',
            config: 0,
            prazo_min: 37,
            prazo_max: 48,
            tax_max: 1.45,
            tax_min: 1.45
          },
          
          {
            name: 'ADIANTAMENTO A DEPOSITANTE (R$30,00 POR ACATAMENTO)',
            type: 'PRODUTOS DE CRÉDITO',
            config: 1,
            prazo_min: 1,
            prazo_max: 1,
            tax_max: 19.0,
            tax_min: 19.0
          },
          {
            name: 'SICOOBCRED CONTA GARANTIDA',
            type: 'PRODUTOS DE CRÉDITO',
            config: 1,
            prazo_min: 1,
            prazo_max: 1,
            tax_max: 3.95,
            tax_min: 3.94
          },
          {
            name: 'SICOOBCRED CDA SIMPLES - PRÉ FIXADO',
            type: 'PRODUTOS DE CRÉDITO',
            config: 1,
            prazo_min: 2,
            prazo_max: 36,
            tax_max: 2,
            tax_min: 1.81
          },
          {
            name: 'SICOOBCRED CDA SIMPLES - POS FIXADO - CDI - Taxa + CDI',
            type: 'PRODUTOS DE CRÉDITO',
            config: 1,
            prazo_min: 2,
            prazo_max: 48,
            tax_max: 9.99,
            tax_min: 9.99
          },
          {
            name: 'SICOOBCRED ESPECIAL',
            type: 'PRODUTOS DE CRÉDITO',
            config: 1,
            prazo_min: 2,
            prazo_max: 36,
            tax_max: 1.0,
            tax_min: 1.0
          },
          {
            name: 'SICOOBCRED CAPITAL DE GIRO - PGTO ÚNICO',
            type: 'PRODUTOS DE CRÉDITO',
            config: 1,
            prazo_min: 6,
            prazo_max: 30,
            tax_max: 2.5,
            tax_min: 2.31
          },
          {
            name: 'SICOOBCRED CAPITAL DE GIRO - PARCELADO (DE 1 a 12 MESES)',
            type: 'PRODUTOS DE CRÉDITO',
            config: 1,
            prazo_min: 1,
            prazo_max: 12,
            tax_max: 1.80,
            tax_min: 1.61
          },
          {
            name: 'SICOOBCRED CAPITAL DE GIRO - PARCELADO (DE 13 a 24 MESES)',
            type: 'PRODUTOS DE CRÉDITO',
            config: 1,
            prazo_min: 13,
            prazo_max: 24,
            tax_max: 1.99,
            tax_min: 1.8
          },
          {
            name: 'SICOOBCRED CAPITAL DE GIRO - PARCELADO  COM GARANTIA DA  SGC  (DE 1 a 12 MESES)',
            type: 'PRODUTOS DE CRÉDITO',
            config: 1,
            prazo_min: 1,
            prazo_max: 12,
            tax_max: 1.70,
            tax_min: 1.50
          },
          {
            name: 'SICOOBCRED CAPITAL DE GIRO - PARCELADO  COM GARANTIA DA  SGC (DE 13 a 24 MESES)',
            type: 'PRODUTOS DE CRÉDITO',
            config: 1,
            prazo_min: 13,
            prazo_max: 24,
            tax_max: 1.9,
            tax_min: 1.7
          },
          {
            name: 'SICOOBCRED CAPITAL DE GIRO - 13º SALÁRIO',
            type: 'PRODUTOS DE CRÉDITO',
            config: 1,
            prazo_min: 1,
            prazo_max: 12,
            tax_max: 1.80,
            tax_min: 1.61
          },
          {
            name: 'SICOOBCRED ROTATIVO',
            type: 'PRODUTOS DE CRÉDITO',
            config: 1,
            prazo_min: 1,
            prazo_max: 1,
            tax_max: 2.20,
            tax_min: 2.10
          },
          {
            name: 'SICOOBCRED DESCONTO DE CHEQUES - ATÉ R$ 10.000,00',
            type: 'PRODUTOS DE CRÉDITO',
            config: 1,
            prazo_min: 5,
            prazo_max: 180,
            tax_max: 1.80,
            tax_min: 1.61
          },
          {
            name: 'SICOOBCRED DESCONTO DE CHEQUES - DE R$ 10.000,01  a R$ 50.000,00',
            type: 'PRODUTOS DE CRÉDITO',
            config: 1,
            prazo_min: 5,
            prazo_max: 180,
            tax_max: 1.59,
            tax_min: 1.40
          },
          {
            name: 'SICOOBCRED DESCONTO DE CHEQUES - ACIMA DE R$ 50.000,00',
            type: 'PRODUTOS DE CRÉDITO',
            config: 1,
            prazo_min: 5,
            prazo_max: 180,
            tax_max: 1.49,
            tax_min: 1.30
          },
          {
            name: 'SICOOBCRED DESCONTO DE DUPLICATAS',
            type: 'PRODUTOS DE CRÉDITO',
            config: 1,
            prazo_min: 5,
            prazo_max: 180,
            tax_max: 1.80,
            tax_min: 1.61
          },
          {
            name: 'SICOOBCRED ANTECIPAÇÃO DE RECEBÍVEIS',
            type: 'PRODUTOS DE CRÉDITO',
            config: 1,
            prazo_min: 1,
            prazo_max: 1,
            tax_max: 1.49,
            tax_min: 1.30
          },
          {
            name: 'SICOOBCRED SIMPLES - PRÉ APROVADO PJ ( MEI, deverá ter análise técnica) (DE 03 a 12 MESES)',
            type: 'PRODUTOS DE CRÉDITO',
            config: 1,
            prazo_min: 3,
            prazo_max: 12,
            tax_max: 2.30,
            tax_min: 2.30
          },
          {
            name: 'SICOOBCRED SIMPLES - PRÉ APROVADO PJ ( MEI, deverá ter análise técnica) (DE 13 a 24  MESES)',
            type: 'PRODUTOS DE CRÉDITO',
            config: 1,
            prazo_min: 13,
            prazo_max: 24,
            tax_max: 2.49,
            tax_min: 2.49
          },
          {
            name: 'SICOOBCRED SIMPLES - PRÉ APROVADO PJ ( MEI, deverá ter análise técnica) (DE 25 a 36  MESES)',
            type: 'PRODUTOS DE CRÉDITO',
            config: 1,
            prazo_min: 25,
            prazo_max: 36,
            tax_max: 2.59,
            tax_min: 2.59
          }]
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
             { name: 'Garantias', value: 30}]              

 csetups = [{name: 'Topazio',                 value: 0   ,fth: 'Reciprocidade de Pedras'},
            {name: 'Safira',                  value: 15  ,fth: 'Reciprocidade de Pedras'},
            { name: 'Rubi',                    value: 20  ,fth: 'Reciprocidade de Pedras'},
            { name: 'Esmeralda',               value: 40  ,fth: 'Reciprocidade de Pedras'},
            { name: 'Diamante',                value: 100 ,fth: 'Reciprocidade de Pedras'},
            { name: 'R13 - R15',               value: 0   ,fth: 'Nota de Risco CRL'},
            { name: 'R12 - R10',               value: 30  ,fth: 'Nota de Risco CRL'},
            { name: 'R9 - R7',                 value: 70  ,fth: 'Nota de Risco CRL'},
            { name: 'Menor que R6',            value: 100  ,fth: 'Nota de Risco CRL'},
            { name: '351 à 450',               value: 20   ,fth: 'Score de Crédito'},
            { name: '451 à 600',               value: 60  ,fth: 'Score de Crédito'},
            { name: '601 à 750',               value: 80  ,fth: 'Score de Crédito'},
            { name: '>751',                    value: 100  ,fth: 'Score de Crédito'},
            { name: 'Sem garantia',            value: 0   ,fth: 'Garantias'},
            { name: 'Aval de Terceiros',       value: 10  ,fth: 'Garantias'},
            { name: 'Cobrança',                value: 10  ,fth: 'Garantias'},
            { name: 'Alienação de Veículos',   value: 20  ,fth: 'Garantias'},
            { name: 'Alienação de Otros bens', value: 20  ,fth: 'Garantias'},
            { name: 'Hipoteca',                value: 15  ,fth: 'Garantias'},
            { name: 'Aplicação Financeira',    value: 20  ,fth: 'Garantias'},
            { name: 'Seguro',                  value: 10  ,fth: 'Garantias'}]

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

