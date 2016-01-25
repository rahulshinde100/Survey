json.array!(@questions) do |question|
  json.extract! question, :id, :que_content, :type, :survey
  json.url question_url(question, format: :json)
end
