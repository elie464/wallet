require 'V1/Entities'
require 'V1/Transactions'

module V1
  class Base < Grape::API
    version 'v1', using: :path

    mount V1::Entities
    mount V1::Transactions
  end
end