class RemoveSectorFromRequisitions < ActiveRecord::Migration[5.2]
  def change
    remove_reference(:requisitions, :sector, index: true, foreign_key: true)
  end
end
