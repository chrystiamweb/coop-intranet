class CreateGoalsReports < ActiveRecord::Migration[5.2]
  def change
    create_table :goals_reports do |t|
      t.string :name
      t.string :description
      t.references :goal_category, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
