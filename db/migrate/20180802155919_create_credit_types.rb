class CreateCreditTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_types do |t|
      t.string :name
      t.string :description
      t.integer :client_type

      t.timestamps
    end
  end
end
