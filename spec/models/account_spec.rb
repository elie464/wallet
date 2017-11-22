require 'rails_helper'

RSpec.describe Account, type: :model do
  let (:owner) {build(:entity)}
  let (:account) {build(:account)}

  it "is valid" do
    expect(account.valid?).to be true
  end

  it "has entity" do
    expect(account.owner).not_to be_nil
    expect(account.owner.present?).to be true
  end

  it "has balance >= 0" do
    expect(account.balance).not_to be_nil
    expect(account.balance).to be >= 0
  end

end
