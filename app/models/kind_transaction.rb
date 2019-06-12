class KindTransaction < ApplicationRecord
  has_many :transaction_values
  validates :description, :nature, :signal, presence: true
  enum nature: { output: 0, input: 1 }
  enum signal: { negative: 0, positive: 1 }
end
