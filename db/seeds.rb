# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "iniciando SEED SEED SEED"
puts "iniciando SEED SEED SEED"
puts "iniciando SEED SEED SEED"
puts "iniciando SEED SEED SEED"
puts "iniciando SEED SEED SEED"
puts "iniciando SEED SEED SEED"

FileType.create!(name: 'Default', description:'Defalt Description')
FileType.create!(name: 'Formulários', description:'Defalt Description')
FileType.create!(name: 'Manuais', description:'Defalt Description')
FileType.create!(name: 'Outros', description:'Defalt Description') 

fotoname = ['hero.jpg', 'loop.jpg', 'nat-1.jpg', 'nat-2.jpg', 'nat-3.jpg', 'nat-4.jpg', 'nat-5.jpg', 'soft.jpg']
fotoname.each do |i|
    temp = Post.create(
        title: Faker::VForVendetta.quote,
        body: Faker::Lorem.paragraph(5),
    )   
    temp.image.attach(io: File.open("public/img/#{i}"), filename: i, content_type:'image/jpg')
end