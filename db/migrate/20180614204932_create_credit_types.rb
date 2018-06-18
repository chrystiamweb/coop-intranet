class CreateCreditTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_types do |t|
      t.string :name
      t.string :description
      t.references :client_type, foreign_key: true

      t.timestamps
    end
  end
end
