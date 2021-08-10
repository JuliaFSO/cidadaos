FactoryBot.define do
  factory :cidadao do
    nome_completo { FFaker::Name.name }
    cpf  { FFaker::IdentificationBR.cpf }
    cns { FFaker.numerify('###############') }
    data_nascimento { (30.year.ago.to_date..Date.today).to_a.sample }
    email { Faker::Internet.email }
    telefone { FFaker.numerify('###########') }
    foto { Rack::Test::UploadedFile.new(File.join("#{Rails.root}/app/assets/images/avatar.png")) }
    status { %w[A B].sample }
    association :endereco, factory: :endereco, strategy: :build
  end
end
