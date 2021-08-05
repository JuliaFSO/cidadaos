class Cidadao < ApplicationRecord
  has_one_attached :foto
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco
  
  validates :nome_completo, :cpf, :cns, :email, :data_nascimento, :telefone, :status, presence: true
  validates_format_of :nome_completo, with: /([\w\-\']{2,})([\s]+)([\w\-\']{2,})/, message: :invalid
  validates :status, inclusion: { in: [ true, false ] }
  validates :cpf, length: { minimum: 11 }
  validates :cns, length: { minimum: 15 }
  validates_format_of :email, with: Devise.email_regexp
  validates :telefone, length: { minimum: 11 }
  validates :data_nascimento, inclusion: { in: 100.year.ago..1.day.ago, message: :out_of_range }
  
  validates :cpf, :email, :cns, uniqueness: true

  def valid_phone
    errors.add(:telefone, I18n.t('errors.messages.invalid')) unless Phonelib.valid_for_country? self.telefone, :br
  end

  def valid_cpf
    cpfs = Cidadao.where.not(id: self.id).map{ |cidadao|
      cidadao.cpf
    }

  return if CPF.valid?(self.cpf) and !cpfs.include? self.cpf

  errors.add(:cpf, :invalid)
  end

  def valid_cns
    return false unless self.cns.present?

    cns = self.cns
    digits = []

    return false if cns.length != 15

    for i in 0..15
      digits << cns[i].to_i * (15 - i)
    end

    errors.add(:cns, :invalid) unless (digits.sum % 11).zero?
  end
end
