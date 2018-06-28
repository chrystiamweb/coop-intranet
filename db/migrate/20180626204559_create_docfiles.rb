class CreateDocfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :docfiles do |t|
      t.string :name
      t.string :description
      t.references :file_type, foreign_key: true

      t.timestamps
    end
  end
end
