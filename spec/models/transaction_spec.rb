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

end
