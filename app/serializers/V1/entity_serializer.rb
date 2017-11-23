module V1
  class EntitySerializer < ActiveModel::Serializer
    has_one :account, serializer: EntityAccountSerializer
    attributes :id, :name, :type

  end
end