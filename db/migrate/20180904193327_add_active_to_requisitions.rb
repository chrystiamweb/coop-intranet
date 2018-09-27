class AddActiveToRequisitions < ActiveRecord::Migration[5.2]
  def change
    add_column :requisitions, :flag, :integer
  end
end
