class CreateReportTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :report_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
