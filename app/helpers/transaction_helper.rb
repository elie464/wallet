module TransactionHelper
  def display_transaction_type(transaction_source, transaction_target, entity_account)
    case transaction_source
      when nil
        if transaction_target == entity_account
          return "Deposit"
        elsif transaction_target != entity_account
          return "Transferred from #{transaction_target.owner.name}"
        end
      else
        if transaction_target == nil
          return "Withdraw"
        elsif transaction_target == entity_account
          return "Tranferred from #{transaction_source.owner.name}"
        elsif transaction_target != entity_account
          return "Transfer to #{transaction_target.owner.name}"
        end
      end
  end

  def display_debit_or_credit(transaction_account, entity_account, amount)
    transaction_account == entity_account ? amount : ""
  end

  def update_current_balance(transaction_account, entity_account, current_balance, amount)
    (transaction_account == entity_account) ? current_balance + amount : current_balance - amount
  end
end
