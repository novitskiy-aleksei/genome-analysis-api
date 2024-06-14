class CreateGeneticTests < ActiveRecord::Migration[7.0]
  def change
    create_table :genetic_tests do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :test_type
      t.string :sample_type
      t.string :status
      t.date :collection_date

      t.timestamps
    end
  end
end
