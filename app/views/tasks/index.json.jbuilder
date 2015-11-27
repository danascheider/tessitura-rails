json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :deadline, :status, :priority, :notes, :position
  json.url task_url(task, format: :json)
end
