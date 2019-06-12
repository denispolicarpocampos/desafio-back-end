class AddUserValueService < ApplicationInteractor
  def self.call(context)
    interactor = new(context)
    interactor.call
    interactor
  end
  
  def initialize(transactions)
    @transactions = transactions
  end

  def call
    value = 0
    @transactions.each do |t|
      if t.kind_transaction.positive?
        value += t.value
      else
        value -= t.value
      end
    end
    answer(value)
  rescue StandardError => e
    fail!(e.message, 500)
  end
end