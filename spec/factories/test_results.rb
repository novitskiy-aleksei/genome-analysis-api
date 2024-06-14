FactoryBot.define do
  factory :test_result do
    association :genetic_test
    gene { "BRCA1" }
    variant { "c.5266dupC" }
    clinical_significance { "pathogenic" }
    zygosity { "heterozygous" }
    associated_conditions { ["Breast cancer", "Ovarian cancer"] }
    recommendations { "Consult with a genetic counselor." }
    date_analyzed { "2024-06-20" }
  end
end
