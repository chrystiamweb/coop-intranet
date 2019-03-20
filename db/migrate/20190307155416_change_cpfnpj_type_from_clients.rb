class ChangeCpfnpjTypeFromClients < ActiveRecord::Migration[5.2]
  def change
    change_column :clients, :cpfcnpj, :string
  end
end
