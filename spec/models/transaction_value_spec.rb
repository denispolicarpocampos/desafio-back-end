require 'rails_helper'

RSpec.describe TransactionValue, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:kind_transaction) }
  end

  describe 'validations' do
    it { should validate_presence_of(:date_occurrency) }
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:card) }
    it { should validate_presence_of(:owner) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:kind_transaction_id) }
    it { should validate_numericality_of(:value).is_greater_than_or_equal_to(0) }
  end
end
