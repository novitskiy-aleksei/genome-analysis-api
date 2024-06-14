class CreateTestResults < ActiveRecord::Migration[7.0]
  def change
    create_table :test_results do |t|
      t.references :genetic_test, null: false, foreign_key: true
      t.string :gene
      t.string :variant
      t.string :clinical_significance
      t.date :date_analyzed

      t.timestamps
    end
  end
end
