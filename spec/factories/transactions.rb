FactoryBot.define do
  factory :transaction do
    association :source, factory: :source, strategy: :build
    association :target, factory: :target, strategy: :build
    amount "5.00"
  end

end
