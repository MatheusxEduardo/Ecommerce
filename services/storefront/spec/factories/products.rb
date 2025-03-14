FactoryBot.define do
  factory :product do
    association :productable, factory: :game
    sequence(:price) { |n| 5.00 + n } # Preços variados
    status { "available" }
    featured { true }
  end
end