class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :name
      t.references :report_type, foreign_key: true
      t.string :action_by

      t.timestamps
    end
  end
end
