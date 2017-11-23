module V1
  class Transactions < Grape::API

    version 'v1', using: :path

    resource :transactions do
      desc "Get all Transaction"
      get do
        Transaction.includes(:source, :target).all
      end

      desc "Post Transaction"
      params do
        optional :source_id, type: Integer
        optional :target_id, type: Integer
        requires :amount, type: BigDecimal
      end
      post do
        new_transaction = Transaction.new(amount: params[:amount])
        new_transaction.source_id = params[:source_id] if params[:source_id]
        new_transaction.target_id = params[:target_id] if params[:target_id]
        transaction_service = TransactionService.new

        if transaction_service.transfer(new_transaction)
          render transaction_service.transaction, serializer: TransactionSerializer
        else
          logger.info("Transaction Error: #{transaction_service.error}")
          error!(transaction_service.error, 422)
        end
      end

    end

    namespace 'entities/:entity_id' do
      resource :transactions do
        desc "Get all Transaction"
        get do
          entity = Entity.find(params[:entity_id])
          entity.get_transactions
        end

      end
    end
  end
end