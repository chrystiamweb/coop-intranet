class CreateRequisitionNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :requisition_notes do |t|
      t.references :requisition, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
