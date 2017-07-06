json.extract! query, :id, :q_id, :content_query, :context_query, :created_at, :updated_at
json.url query_url(query, format: :json)
