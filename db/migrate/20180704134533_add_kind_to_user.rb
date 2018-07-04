class AddKindToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :kind, :integer
  end
end
