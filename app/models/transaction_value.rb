class TransactionValue < ApplicationRecord
  belongs_to :user
  belongs_to :kind_transaction

  validates :date_occurrency, :value, :cpf, :card, :owner, 
            :name, :user_id, :kind_transaction_id, presence: true

  validates_numericality_of :value, greater_than_or_equal_to: 0
end
