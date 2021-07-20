class Cidadao < ApplicationRecord
  has_one_attached :foto
  has_one :endereco
  accepts_nested_attributes_for :endereco
  # validates :nome_completo, :cpf, :email, :data_nascimento, :telefone, :status, presence: true
  # validates :cpf, length: { minimum: 11 }
  # validates :email, format: { with: /\A.*@.*\.com\z/ }
  # validates :telefone, length: { minimum: 13 }
  
  # validates :cpf, :email, uniqueness: true
end
