require 'rails_helper'

RSpec.describe "Transfers", type: :request do
  before do
    create(:entity1)
    create(:entity2)
  end
  let(:transaction) {build(:transaction)}

  it "transfers correctly" do
    visit transactions_url
    within("form#new_transaction") do
      select transaction.target.owner.name, :from => "transaction[target_id]"
      fill_in "transaction[amount]", :with => transaction.amount
    end
    click_button 'Transfer'
    new_transaction = Transaction.last
    expect(new_transaction.amount).to eq(transaction.amount)
    expect(new_transaction.target.owner.name).to eq(transaction.target.owner.name)
    expect(new_transaction.target.balance).to eq(transaction.amount)
  end
end
