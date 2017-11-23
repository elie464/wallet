module V1
  class TransactionSerializer < ActiveModel::Serializer
    belongs_to :source, serializer: V1::AccountSerializer
    belongs_to :target, serializer: V1::AccountSerializer

    attributes :id, :amount

  end
end