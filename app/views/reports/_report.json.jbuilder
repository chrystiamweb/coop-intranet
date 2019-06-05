json.extract! report, :id, :name, :report_type_id, :action_by, :created_at, :updated_at
json.url report_url(report, format: :json)
