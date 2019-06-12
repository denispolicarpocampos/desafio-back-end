class KindTransactionsController < ApplicationController
  before_action :find_user

  def show
    @transactions = @user.transaction_values.include(:kind_transactions).paginate(page: params[:page])
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

end