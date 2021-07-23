class Cidadao < ApplicationRecord
  has_one_attached :foto
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco
  
  validates :nome_completo, :cpf, :email, :data_nascimento, :telefone, presence: true
  validates :status, inclusion: { in: [ true, false ] }
  validates :cpf, length: { minimum: 11 }
  validates_format_of :email, with: Devise.email_regexp
  validates :telefone, length: { minimum: 11 }
  
  validates :cpf, :email, uniqueness: true
end
