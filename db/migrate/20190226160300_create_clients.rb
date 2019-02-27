class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :cpfcnpj
      t.string :income_type
      t.string :category
      t.string :rating
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
