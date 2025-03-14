FactoryBot.define do
  factory :game do
    release_date { 2.days.ago }
    featured { true }
  end
end