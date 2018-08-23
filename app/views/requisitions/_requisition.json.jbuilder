json.extract! requisition, :id, :title, :description, :requisition_status_id, :requisition_category_id, :requisition_type, :created_at, :updated_at
json.url requisition_url(requisition, format: :json)
