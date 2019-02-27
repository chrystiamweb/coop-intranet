class ChangeRequisitionsSchema < ActiveRecord::Migration[5.2]
  def change
    remove_column :requisitions, :site_location
    add_reference :requisitions, :location, foreign_key: true
    add_reference :requisitions, :client, foreign_key: true
    add_reference :requisitions, :modality, foreign_key: true
    add_reference :requisitions, :submodality, foreign_key: true
    add_reference :requisitions, :sector, foreign_key: true
    add_column    :requisitions, :value, :float
    add_column    :requisitions, :requisition_number, :integer
    end
end
