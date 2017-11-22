class Entity < ApplicationRecord
  has_one :account, :as => :owner, dependent: :destroy
  validates_presence_of :name, :type

  after_save :create_account

  def create_account
    new_account = Account.create!(owner: self)
    new_account.save!
  end

  delegate :id, to: :account, prefix: true
end
