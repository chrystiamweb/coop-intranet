class CreateLinhaCreditos < ActiveRecord::Migration[5.2]
  def change
    create_table :linha_creditos do |t|
      t.string :name
      t.string :description
      t.references :client_type, foreign_key: true
      t.references :credit_type, foreign_key: true

      t.timestamps
    end
  end
end
