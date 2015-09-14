json.array!(@subjects) do |subject|
  json.extract! subject, :id, :subject, :from, :priority, :to, :project_id
  json.url subject_url(subject, format: :json)
end
