class AddSiteLocationToRequisition < ActiveRecord::Migration[5.2]
  def change
    add_column :requisitions, :site_location, :string
  end
end
