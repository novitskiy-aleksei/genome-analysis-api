# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Clear existing data
GeneticTest.destroy_all
TestResult.destroy_all

# Create genetic tests for patients
test1 = GeneticTest.create!(
  member_id: 1,
  test_type: "exome",
  sample_type: "saliva",
  status: "scheduled",
  collection_date: "2024-06-15"
)

test2 = GeneticTest.create!(
  member_id: 2,
  test_type: "genome",
  sample_type: "blood",
  status: "completed",
  collection_date: "2024-06-10"
)

test3 = GeneticTest.create!(
  member_id: 3,
  test_type: "targeted_panel",
  sample_type: "saliva",
  status: "scheduled",
  collection_date: "2024-06-20"
)

# Create test results for genetic tests
TestResult.create!(
  genetic_test: test2,
  gene: "BRCA1",
  variant: "c.5266dupC",
  clinical_significance: "pathogenic",
  zygosity: "heterozygous",
  associated_conditions: ["Breast cancer", "Ovarian cancer"],
  recommendations: "Consult with a genetic counselor.",
  date_analyzed: "2024-06-20"
)

TestResult.create!(
  genetic_test: test3,
  gene: "BRCA2",
  variant: "c.7977-1G>C",
  clinical_significance: "pathogenic",
  zygosity: "homozygous",
  associated_conditions: ["Breast cancer", "Prostate cancer"],
  recommendations: "Regular screening for associated cancers.",
  date_analyzed: "2024-06-20"
)

puts "Seed data created successfully!"