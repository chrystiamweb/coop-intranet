class CreateSubmodalities < ActiveRecord::Migration[5.2]
  def change
    create_table :submodalities do |t|
      t.string :title
      t.text :despcription
      t.references :modality, foreign_key: true

      t.timestamps
    end
  end
end
