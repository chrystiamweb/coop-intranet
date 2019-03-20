json.clients do
    json.array!(@clients) do |client|
        json.id client.id
        json.name client.name
        json.cpfcnpj client.cpfcnpj
      end
end