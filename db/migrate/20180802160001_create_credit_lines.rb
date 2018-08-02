class CreateCreditLines < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_lines do |t|
      t.string :name
      t.string :description
      t.integer :client_type
      t.references :credit_type, foreign_key: true

      t.timestamps
    end
  end
end
