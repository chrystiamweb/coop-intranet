class CreateRequisitions < ActiveRecord::Migration[5.2]
  def change
    create_table :requisitions do |t|
      t.string :title
      t.text :description
      t.references :requisition_status, foreign_key: true
      t.references :requisition_category, foreign_key: true
      t.string :requisition_type

      t.timestamps
    end
  end
end
