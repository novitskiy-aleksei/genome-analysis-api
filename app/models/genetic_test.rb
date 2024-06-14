class GeneticTest < ApplicationRecord
  has_many :test_results, dependent: :destroy

  validates :member_id, presence: true
  validates :test_type, presence: true
  validates :sample_type, presence: true
  validates :status, presence: true

  serialize :results, JSON
end
