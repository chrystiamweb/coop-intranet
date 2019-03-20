class RemoveSiteLocationFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :site_location
    add_reference :users, :location, foreign_key: true
  end
end
