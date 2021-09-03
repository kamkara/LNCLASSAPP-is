json.extract! course, :id, :title, :content, :slug, :level_id, :material_id, :user_id, :created_at, :updated_at
json.url course_url(course, format: :json)
