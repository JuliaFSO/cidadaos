class Cidadao < ApplicationRecord
  has_one_attached :foto
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco
  
  validates :nome_completo, :cpf, :cns, :email, :data_nascimento, :telefone, presence: true
  validates :status, inclusion: { in: [ true, false ] }
  validates :cpf, length: { minimum: 11 }
  validates :cns, length: { minimum: 15 }
  validates_format_of :email, with: Devise.email_regexp
  validates :telefone, length: { minimum: 11 }
  
  validates :cpf, :email, :cns, uniqueness: true
  before_save :format_phone

  def format_phone
    self.telefone = PhoneLib.parse(telefone)
  end
end
