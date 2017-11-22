class TransactionService
  attr_accessor :error

  def initialize
    @error = nil
  end

  def transfer(transaction)
    result = true

    Transaction.transaction do
      begin
        transaction.save!
        update_balance(transaction.source, -transaction.amount) if transaction.source
        update_balance(transaction.target, transaction.amount) if transaction.target
      rescue => e
        Rails.logger.info(e)
        @error = e.to_s
        result = false
        raise ActiveRecord::Rollback
      end
    end
    result
  end

  private

  def update_balance(account, amount)
    account.update_attribute(:balance, account.balance + amount)
  end
end