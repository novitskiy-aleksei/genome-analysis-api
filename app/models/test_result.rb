class TestResult < ApplicationRecord
  belongs_to :genetic_test

  serialize :associated_conditions, Array
end
