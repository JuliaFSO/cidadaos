class Cidadao < ApplicationRecord
  has_one_attached :photo
  validates :nome_completo, :cpf, :email, :data_nascimento, :telefone, :status, presence: true
  validates :cpf, length: { minimum: 11 }
  validates :email, format: { with: /\A.*@.*\.com\z/ }
  validates :telefone, length: { minimum: 13 }
  
  validates :cpf, :email, uniqueness: true
end
