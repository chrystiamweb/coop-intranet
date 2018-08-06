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
