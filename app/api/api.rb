require 'grape-swagger'
require 'V1/base'

class API < Grape::API
  include Defaults

  mount V1::Base

  desc "Ping"
  get '/ping' do
    'pong'
  end

  add_swagger_documentation(
    info: {
      title: "Wallet API",
      description: "This is the developer API for Wallet",
      contact_name: "Ernest Lie"
    },
    doc_version: "1",
    hide_documentation_path: true,
    hide_format: true
  )

  #Grape Endpoint Not Found (must be placed at the bottom as it matches to all)
  route :any, '*path' do
    error!('404 Not Found', 404)
  end

end

