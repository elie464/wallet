class Transaction < ApplicationRecord
  belongs_to :source, :class_name => 'Account'
  belongs_to :target, :class_name => 'Account'
  validates_presence_of :source, :target, :amount
  validates_numericality_of :amount, :greater_than_or_equal_to => 0
  validate :different_entities
  validate :enough_funds

  def different_entities
    self.errors.add(:base, 'Source must be different to target') if source == target
  end

  def enough_funds
    self.errors.add(:base, 'Source does not have enough funds') if source.balance < amount
  end

end
