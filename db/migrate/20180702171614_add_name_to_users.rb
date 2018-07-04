class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string  
    add_column :users, :login, :string
    add_column :users, :role, :string
    add_column :users, :birthday, :date
    add_column :users, :site_location, :string
  end
end
