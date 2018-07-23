class AddFullNameToUsers < ActiveRecord::Migration[5.2]
  def change
   add_column :users, :full_name, :string
   remove_column :users, :first_name
   remove_column :users, :last_name
  end
end
