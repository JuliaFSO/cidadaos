# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

poster_image_url = 'https://unsplash.com/s/photos/portrait'

destroy.all


puts 'Criando 100 munícipes...'
100.times do
  municipe = Cidadao.new(
    nome_completo: Faker::Name.name,
    cpf: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    email:    Faker::Company.name,
    data_nascimento: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    telefone:    Faker::Company.name,
    foto: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    status:    Faker::Company.name,
    cep: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    logradouro: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    bairro:    Faker::Company.name,
    cidade: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    uf: "#{Faker::Address.street_address}, #{Faker::Address.city}",
  )
  municipe.save!
end
puts 'Pronto!'
