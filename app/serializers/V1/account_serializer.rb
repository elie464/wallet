module V1
  class AccountSerializer < ActiveModel::Serializer

    attributes :id, :owner, :balance

  end
end