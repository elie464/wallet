FactoryBot.define do
  factory :entity, aliases: [:entity1] do
    name "testuser"
    type "User"
  end

  factory :entity2, class: Entity do
    name "testteam"
    type "Team"
  end

  factory :entity3, class: Entity do
    name "teststock"
    type "Stock"
  end
end
