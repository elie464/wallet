require 'rails_helper'

RSpec.describe Entity, type: :model do
  let (:entity) {build(:entity)}

  it "is valid" do
    expect(entity.valid?).to be true
  end

  it "has name" do
    expect(entity.name).not_to be_empty
  end

  it "has type" do
    expect(entity.type).not_to be_empty
    expect(["User", "Team", "Stock"]).to include(entity.type)
  end

  it "creates an account" do
    entity = create(:entity)
    expect(entity.account).not_to be_nil
    expect(entity.account.balance).to eq(0)
  end

  it "updates successfully" do
    entity.update_attributes(name: "newname")
    expect(entity.name).to eq("newname")
    expect(entity.valid?).to be true
  end

  describe "team" do
    let(:team) {build(:entity2)}

    it "is valid" do
      expect(team.valid?).to be true
    end

    it "is of type team" do
      expect(team.type).to eq("Team")
    end
  end
end
