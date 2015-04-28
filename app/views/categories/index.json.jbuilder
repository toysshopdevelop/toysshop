json.array!(@categories) do |category|
  json.extract! category, :id, :title, :parent_id
  json.url category_url(category, format: :json)
end
