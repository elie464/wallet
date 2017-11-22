require 'rails_helper'

RSpec.describe "CreateEntities", type: :request do
  let(:entity) {build(:entity)}

  it "creates entity correctly" do
    visit entities_url
    within("form#new_entity") do
      fill_in "entity[name]", :with => entity.name
      select entity.type, :from => "entity[type]"
    end
    click_button 'Create'
    new_entity = Entity.last
    expect(page.current_path).to eq(entity_path(new_entity))
    expect(page).to have_content("Balance")
    expect(new_entity.account).not_to be_nil
  end
end
