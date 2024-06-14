FactoryBot.define do
  factory :genetic_test do
    member_id { 1 }
    test_type { "exome" }
    sample_type { "saliva" }
    status { "scheduled" }
    collection_date { "2024-06-15" }
  end
end
