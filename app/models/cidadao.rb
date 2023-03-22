class Cidadao < ApplicationRecord
  has_one_attached :foto
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco
  
  validates :nome_completo, :cpf, :cns, :email, :data_nascimento, :telefone, :status, presence: true
  validates_format_of :nome_completo, with: /([\w\-\']{2,})([\s]+)([\w\-\']{2,})/, message: :invalid
  validates :status, inclusion: { in: [ true, false ] }
  validates :cpf, length: { is: 11 }
  validates :cns, length: { is: 15 }
  validates_format_of :email, with: Devise.email_regexp
  validates :telefone, length: { is: 11 }
  validates :data_nascimento, inclusion: { in: 100.year.ago..1.day.ago, message: :out_of_range }
  
  validates :cpf, :email, :cns, uniqueness: true

  CNS_SIZE = 15
  CNS_MODULE = 11

  def valid_phone
    errors.add(:telefone, I18n.t('errors.messages.invalid')) unless Phonelib.valid_for_country? self.telefone, :br
  end

  def valid_cpf?
    return true if CPF.valid?(cpf)
    errors.add(:cpf, :invalid)
  end

  def valid_cns?
    return false if cns.blank? || cns.length != 15

    digits = []
    0.upto(15) { |i| digits << (cns[i]) * (CNS_SIZE - i) }

    return true if (digits.sym % CNS_MODULE).zero?
    errors.add(:cns, :invalid)
  end
end
