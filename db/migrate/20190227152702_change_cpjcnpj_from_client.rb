class ChangeCpjcnpjFromClient < ActiveRecord::Migration[5.2]
  def change
    change_column :clients, :cpfcnpj, :bigint
  end
end
