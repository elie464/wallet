require 'rails_helper'

RSpec.describe Account, type: :model do
  let (:entity) {build(:entity)}
  let (:account) {build(:account)}

  it "is valid" do
    expect(account.valid?).to be true
  end

  it "has entity" do
    expect(account.entity).not_to be_nil
  end

  it "has balance >= 0" do
    expect(account.balance).not_to be_nil
    expect(account.balance).to be >= 0
  end

end
