FactoryBot.define do
  factory :endereco do
    cep { FFaker::AddressBR.zip_code }
    logradouro { FFaker::AddressBR.street_name }
    complemento { FFaker::AddressBR.secondary_address }
    bairro { FFaker::AddressBR.neighborhood }
    cidade { FFaker::AddressBR.city }
    uf { FFaker::AddressBR.country_code }
  end
end
