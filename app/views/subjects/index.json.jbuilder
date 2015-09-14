json.array!(@subjects) do |subject|
  json.extract! subject, :id, :subject, :from, :priority, :to, :project_id,:hit_count
  json.url subject_url(subject, format: :json)
end
