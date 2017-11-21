class Entity < ApplicationRecord
  has_one :account, :as => :entity
  enum type: ["User", "Team", "Stock"]

  validates_presence_of :name, :type

end
