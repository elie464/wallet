class Account < ApplicationRecord
  belongs_to :owner, polymorphic: true
  has_many :debits, :class_name => 'Transaction', :foreign_key => 'source_id', dependent: :destroy
  has_many :credits, :class_name => 'Transaction', :foreign_key => 'target_id', dependent: :destroy

  # to allow sub types of entity to properly associate with polymorphic
  def owner_type=(sType)
    super(sType.to_s.classify.constantize.base_class.to_s)
  end

  validates_presence_of :owner, :balance
  validates_numericality_of :balance, :greater_than_or_equal_to => 0

end
