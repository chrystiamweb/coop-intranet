class AddSectorRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :sector, foreign_key: true
  end
end
