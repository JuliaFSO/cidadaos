class Endereco < ApplicationRecord
  belongs_to :cidadao
  validates :cep, :logradouro, :bairro, :cidade, :uf, presence: true
  accepts_nested_attributes_for :cidadao
end
