class AddFlowToStatusAction < ActiveRecord::Migration[5.2]
  def change
    add_reference :status_actions, :sector_flow, foreign_key: true
  end
end
