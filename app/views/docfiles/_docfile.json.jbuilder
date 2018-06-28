json.extract! docfile, :id, :name, :description, :file_type_id, :created_at, :updated_at
json.url docfile_url(docfile, format: :json)
