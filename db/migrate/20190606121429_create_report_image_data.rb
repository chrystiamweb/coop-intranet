class CreateReportImageData < ActiveRecord::Migration[5.2]
  def change
    create_table :report_image_data do |t|
      t.string :name
      t.references :location, foreign_key: true
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
