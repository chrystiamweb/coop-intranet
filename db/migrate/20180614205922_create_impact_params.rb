class CreateImpactParams < ActiveRecord::Migration[5.2]
  def change
    create_table :impact_params do |t|
      t.string :name
      t.integer :impact
      t.references :criteria_name, foreign_key: true

      t.timestamps
    end
  end
end
