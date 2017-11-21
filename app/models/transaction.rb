class Transaction < ApplicationRecord
  belongs_to :account
  validates_presence_of :account, :direction, :amount
  validates_numericality_of :amount, :greater_than_or_equal_to => 0
end
