class CreateStatusActions < ActiveRecord::Migration[5.2]
  def change
    create_table :status_actions do |t|
      t.references :requisition, foreign_key: true
      t.datetime :start
      t.datetime :finish
      t.text :description
      t.references :requisition_status, foreign_key: true
      t.string :action_by

      t.timestamps
    end
  end
end
