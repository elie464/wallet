module Defaults
  # if you're using Grape outside of Rails, you'll have to use Module#included hook
  extend ActiveSupport::Concern

  included do

    ######## Common Grape Settings ########
    prefix 'api'
    format :json
    formatter :json,
              Grape::Formatter::ActiveModelSerializers

    ######## HELPER FUNCTIONS ########

    helpers do
      def logger
        API.logger
      end

    end

    ######## Error Handling ########

    # global handler for simple not found case
    rescue_from ActiveRecord::RecordNotFound do |e|
      error_response(message: e.message, status: 404)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      error_response(message: e.message, status: 422)
    end

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      error_response(message: e.message, status: 400)
    end

    # global exception handler, used for error notifications
    rescue_from :all do |e|
      logger.info(e)
      error_response(message: "Internal server error", status: 500)
    end

  end

end