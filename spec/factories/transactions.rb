FactoryBot.define do
  factory :transaction do
    association :source, factory: :account, strategy: :build
    association :target, factory: :target, strategy: :build
    amount "20.00"
  end
end
