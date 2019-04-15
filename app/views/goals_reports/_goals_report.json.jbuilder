json.extract! goals_report, :id, :name, :description, :goal_category_id, :location_id, :created_at, :updated_at
json.url goals_report_url(goals_report, format: :json)
