class KindTransactionsController < ApplicationController
  def index
    transactions = current_user.transaction_values.includes(:kind_transaction)
    @transactions = transactions.paginate(page: params[:page], per_page: 15)
    response = AddUserValueService.call(transactions)
    if response.success?
      @value = response.result
    else
      @value = 'Não foi possível calcular seu saldo no momento!'
    end
  end
end