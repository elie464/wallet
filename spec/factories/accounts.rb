FactoryBot.define do
  factory :account do
    association :entity, factory: :entity, strategy: :build
    balance "9.99"
  end
end
