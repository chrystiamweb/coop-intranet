class CreateCriteriaImpactDefinitions < ActiveRecord::Migration[5.2]
  def change
    create_table :criteria_impact_definitions do |t|
      t.references :criterium, foreign_key: true
      t.float :impact

      t.timestamps
    end
  end
end
