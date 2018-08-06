class CreateCreditLineSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_line_settings do |t|
      t.string :name
      t.string :description
      t.references :credit_line, foreign_key: true
      t.integer :deadline_max
      t.integer :deadline_min
      t.string :tax_description
      t.float :tax_max
      t.float :tax_min
      t.integer :client_type
      t.integer :deadline_setup

      t.timestamps
    end
  end
end
