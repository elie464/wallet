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

  describe "team" do
    let(:team) {build(:team)}

    it "is valid" do
      expect(team.valid?).to be true
    end

    it "is of type team" do
      expect(team.type).to eq("Team")
    end
  end
end
