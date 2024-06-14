class CreateGeneticTests < ActiveRecord::Migration[6.1]
  def change
    create_table :genetic_tests do |t|
      t.integer :member_id, null: false
      t.string :test_type, null: false
      t.string :sample_type, null: false
      t.string :status, null: false, default: 'scheduled'
      t.date :collection_date
      t.text :results

      t.timestamps
    end

    add_index :genetic_tests, :member_id
  end
end