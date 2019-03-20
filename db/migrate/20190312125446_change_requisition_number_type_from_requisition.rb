class ChangeRequisitionNumberTypeFromRequisition < ActiveRecord::Migration[5.2]
  def change
    change_column :requisitions, :requisition_number, :string
  end
end
