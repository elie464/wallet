class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transactions_url }
      else
        flash[:danger] = "#{@transaction.errors.full_messages.first}"
        format.html { redirect_to transactions_url }
      end
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:source_id, :target_id, :amount)
  end

end