class AddRequesterToRequisition < ActiveRecord::Migration[5.2]
  def change
    add_column :requisitions, :requester_id, :integer
  end
end
