require 'rails_helper'

RSpec.describe Cidadao, type: :model do
  context 'model validates' do
    let!(:cidadao) { build(:cidadao, data_nascimento: 15.year.ago.to_date) }

    it 'validate attrs presence' do
      expect(cidadao).to be_valid
    end

    it 'validate birth date had included in range' do
      cidadao.data_nascimento = Date.today.end_of_month

      expect(cidadao).to be_invalid
    end

    it "is not valid without a cpf" do
      cidadao.cpf = '11111111111'
      expect(cidadao.cpf).to_not be_valid
      expect(cidadao.cpf).to be_valid
    end

    it 'validate nested attrs' do
      accepts_nested_attributes_for(:endereco)
    end
  end

end
