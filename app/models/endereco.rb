class Endereco < ApplicationRecord
  belongs_to :cidadao
  validates :cep, :logradouro, :bairro, :cidade, :uf, presence: true
end
