FactoryBot.define do
  factory :account do
    association :owner, factory: :entity, strategy: :build
    balance "9.99"
  end
end
