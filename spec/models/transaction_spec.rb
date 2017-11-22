require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let (:transaction) {build(:transaction)}

  it "is valid" do
    expect(transaction.valid?).to be true
  end

  it "has amount >= 0" do
    expect(transaction.amount).not_to be_nil
    expect(transaction.amount).to be >= 0
  end

  it "transfer less than source balance" do
    expect(transaction.amount).to be <= (transaction.source.balance)
  end

  it "fails when transferring more than source balance" do
    new_transaction = build(:transaction, amount: 20)
    expect(new_transaction.valid?).to be false
  end

  it "has either source or target id" do
    expect(transaction.source.present? || transaction.target.present?).to be true
  end

  it "fails when no source or target id" do
    new_transaction = build(:transaction, source_id: nil, target_id: nil)
    expect(new_transaction.source.present? || new_transaction.target.present?).to be false
  end

end
