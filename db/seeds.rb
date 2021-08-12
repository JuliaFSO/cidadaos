# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Cidadao.destroy_all
Endereco.destroy_all

puts 'Criando 10 munícipes...'
10.times do
  cidadao = Cidadao.create!(
    nome_completo: Faker::Name.name,
    cpf: Faker::Number.number(digits: 11),
    cns: Faker::Number.number(digits: 15),
    email: Faker::Internet.email,
    data_nascimento: Faker::Date.birthday(min_age: 18, max_age: 65),
    telefone: "#{Faker::PhoneNumber.subscriber_number(length: 2)}9#{Faker::PhoneNumber.subscriber_number}#{Faker::PhoneNumber.subscriber_number}",
    status: 'Ativo'
  )
  cidadao.foto.attach(io: File.open(File.join(Rails.root,'app/assets/images/avatar.png')), filename: 'avatar.png')

  Endereco.create!(
    cidadao_id: cidadao.id,
    cep: "#{Faker::Number.number(digits: 8)}",
    logradouro: "#{Faker::Address.street_suffix} #{Faker::Address.street_name}, #{Faker::Address.building_number}",
    complemento: Faker::Address.secondary_address,
    bairro: Faker::Address.city,
    cidade: Faker::Address.city,
    uf: Faker::Address.state_abbr
  )
end

puts '10 munícipes criados...'