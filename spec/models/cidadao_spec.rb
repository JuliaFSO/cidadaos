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

    it 'validate if cpf is valid and unique' do
      cidadao.cpf = '11111111111'

      cidadao.valid?
      expect(cidadao.errors[:cpf]).to contain_exactly 'cpf precisa ser válido'
    end

    describe 'validate nested attrs' do
      it { is_expected.to accept_nested_attributes_for(:endereco) }
    end
  end

end
