class Client < ApplicationRecord
  
  belongs_to :location
  validates :name, presence: true
  validates :cpfcnpj, presence: true, length: { maximum: 14 }

  def self.import(file)
    xml_file = File.read(file.path)
    hash_data = Hash.from_xml(xml_file)
    hash_data['dataset']['data']['row'].each do |data|    
      Client.where(cpfcnpj: data['value'][0]).first_or_create do |client|
        client.name = data['value'][1]
        client.cpfcnpj = data['value'][0]
        client.income_type = data['value'][2]
        client.category = data['value'][3]
        client.rating = data['value'][4]
        client.location = Location.where(name:  data['value'][5].length < 2 ? "PA0#{data['value'][5]}" : "PA#{data['value'][5]}").first
      end
    end
  end
  
end