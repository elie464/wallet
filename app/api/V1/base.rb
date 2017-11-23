require 'V1/entities'
require 'V1/transactions'

module V1
  class Base < Grape::API
    version 'v1', using: :path

    mount V1::Entities
    mount V1::Transactions
  end
end