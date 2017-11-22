FactoryBot.define do
  factory :account, aliases: [:source] do
    association :owner, factory: :entity, strategy: :build
    balance "9.99"
  end

  factory :target, :class => :account do
    association :owner, factory: :entity2, strategy: :build
    balance "5.00"
  end

end
