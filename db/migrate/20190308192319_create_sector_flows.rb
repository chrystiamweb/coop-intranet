class CreateSectorFlows < ActiveRecord::Migration[5.2]
  def change
    create_table :sector_flows do |t|
      t.integer :position
      t.references :sector, foreign_key: true

      t.timestamps
    end
  end
end
