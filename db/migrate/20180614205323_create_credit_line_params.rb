class CreateCreditLineParams < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_line_params do |t|
      t.string :name
      t.string :description
      t.integer :max_term
      t.integer :min_term
      t.integer :tax_max
      t.integer :tax_min
      t.string :tax_obs
      t.references :client_type, foreign_key: true
      t.references :credit_type, foreign_key: true

      t.timestamps
    end
  end
end
