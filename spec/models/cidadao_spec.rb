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
      expect(cidadao.cpf.length).to be (11)
    end

    describe "Associations" do
      it { is_expected.to have_one(:endereco) }
    end
  end

end
