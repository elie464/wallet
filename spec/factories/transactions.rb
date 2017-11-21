FactoryBot.define do
  factory :transaction do
    association :account, factory: :account, strategy: :build
    amount "9.99"
    direction 1
  end
end
