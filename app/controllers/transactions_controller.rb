class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    transaction_service = TransactionService.new

    respond_to do |format|
      if transaction_service.transfer(@transaction)
        format.html { redirect_to transactions_url }
      else
        flash[:danger] = "#{transaction_service.error}"
        format.html { redirect_to transactions_url }
      end
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:source_id, :target_id, :amount)
  end

end