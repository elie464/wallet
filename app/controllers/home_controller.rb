class HomeController < ApplicationController
  def index
    @entity_count = Entity.all.count
    @transaction_count = Transaction.all.count
  end
end