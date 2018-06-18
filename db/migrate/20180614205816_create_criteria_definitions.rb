class CreateCriteriaDefinitions < ActiveRecord::Migration[5.2]
  def change
    create_table :criteria_definitions do |t|
      t.references :criteria_name, foreign_key: true
      t.string :name
      t.string :description
      t.integer :value

      t.timestamps
    end
  end
end
