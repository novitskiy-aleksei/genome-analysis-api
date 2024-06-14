class AddFieldsToTestResults < ActiveRecord::Migration[7.0]
  def change
    add_column :test_results, :zygosity, :string
    add_column :test_results, :associated_conditions, :text
    add_column :test_results, :recommendations, :text
  end
end
