class Transaction < ApplicationRecord
  belongs_to :source, :class_name => 'Account', optional: true
  belongs_to :target, :class_name => 'Account', optional: true
  validates :amount, presence: true
  validates_numericality_of :amount, :greater_than => 0
  validate :different_entities
  validate :enough_funds

  def different_entities
    self.errors.add(:base, 'Source must be different to target') if source == target
  end

  def enough_funds
    self.errors.add(:base, 'Source does not have enough funds') if source && amount && source.balance < amount
  end

end
