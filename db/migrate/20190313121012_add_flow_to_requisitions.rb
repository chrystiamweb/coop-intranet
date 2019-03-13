class AddFlowToRequisitions < ActiveRecord::Migration[5.2]
  def change
    add_reference :requisitions, :sector_flow, foreign_key: true
  end
end
