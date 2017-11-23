# GrapeSwaggerRails.options.before_action do |request|
#   # 1. Inspect the `request` or access the Swagger UI controller via `self`.
#   # 2. Check `current_user` or `can? :access, :api`, etc.
#   # 3. Redirect or error in case of failure.
#   session[:current_user]
# end



GrapeSwaggerRails.options.url      = 'api/swagger_doc'
GrapeSwaggerRails.options.app_url  = '/'
GrapeSwaggerRails.options.doc_expansion = 'list'
GrapeSwaggerRails.options.app_name = 'Wallet'
GrapeSwaggerRails.options.hide_url_input = true
GrapeSwaggerRails.options.hide_api_key_input = true


