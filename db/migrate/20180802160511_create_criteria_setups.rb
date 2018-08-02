class CreateCriteriaSetups < ActiveRecord::Migration[5.2]
  def change
    create_table :criteria_setups do |t|
      t.references :criterium, foreign_key: true
      t.string :criteria_name
      t.string :description
      t.float :value
      t.float :real_value

      t.timestamps
    end
  end
end
