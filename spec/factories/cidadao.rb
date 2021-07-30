FactoryBot.define do
  factory :cidadao do
    nome_completo { FFaker::Name.name }
    cpf  { FFaker::IdentificationBR.cpf }
    cns  { [*1..99999].sample }
    data_nascimento { FFaker::Time.date }
    telefone { FFaker::PhoneNumberBR.international_mobile_phone_number.delete('^0-9') }
    foto { Rack::Test::UploadedFile.new(File.join("#{Rails.root}/app/assets/images/avatar.png")) }
    status { %w[A B].sample }
    endereco
  end
end
