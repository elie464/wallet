class Entity < ApplicationRecord
  has_one :account, :as => :owner, dependent: :destroy
  validates_presence_of :name, :type

  after_save :create_account

  def create_account
    new_account = Account.create!(owner: self)
    new_account.save!
  end

  delegate :id, :balance, to: :account, prefix: true

  def get_transactions
    Transaction.where("source_id = ? or target_id = ?", self.account_id, self.account_id).order('created_at desc')
  end
end
