module TransactionHelper
  def display_debit_or_credit(transaction_account, entity_account, transaction)
    transaction_account == entity_account ? transaction : ""
  end

  def update_current_balance(transaction_account, entity_account, current_balance, amount)
    (transaction_account == entity_account) ? current_balance + amount : current_balance - amount
  end
end
