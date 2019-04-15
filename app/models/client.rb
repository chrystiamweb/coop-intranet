class Client < ApplicationRecord
  require 'csv'
  belongs_to :location
  validates :name, presence: true
  validates :cpfcnpj, presence: true, length: { maximum: 14 }

  def self.import(file)
    csv_text = File.read(file)
    byebug
    csv_text.foreach(file.path, :headers => true) do |p|
      Client.where(cpfcnpj: p["Número CPF/CNPJ"]).first_or_create do |client|
        client.name = p["Nome Cliente"]
        client.cpfcnpj = p["Número CPF/CNPJ"]
        client.income_type = p["Tipo de Renda"]
        client.category = p["Sigla Tipo Pessoa"]
        client.rating = p["Descrição Nivel Risco CRL"]
        client.location = Location.where(name:  p['Número PA'].length < 2 ? "PA0#{p['Número PA']}" : "PA#{p['Número PA']}").first
      end
    end
  end
  
end