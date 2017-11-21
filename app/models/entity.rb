class Entity < ApplicationRecord
  has_one :account, :as => :entity
  validates_presence_of :name, :type

end
