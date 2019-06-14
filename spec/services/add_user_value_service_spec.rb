require 'rails_helper'

describe AddUserValueService do
  let(:transactions) { create_list(:transaction_value, Random.rand(1..5)) }

  subject do
    described_class.call(transactions)
  end

  context "result without errors" do

    it 'has status sucess' do
      expect(subject.success?).to eq(true)
    end

    it 'return result numeric' do
      expect(subject.result).to be_a_kind_of(Numeric)
    end

    it 'transactions ' do
      expect(described_class.call([]).result).to eq(0)
    end
  end
end