require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let (:account) {build(:account)}
  let (:transaction) {build(:transaction)}

  it "is valid" do
    expect(transaction.valid?).to be true
  end

  it "has source and target" do
    expect(transaction.source).not_to be_nil
    expect(transaction.target).not_to be_nil
  end

  it "has amount >= 0" do
    expect(transaction.amount).not_to be_nil
    expect(transaction.amount).to be >= 0
  end

end
