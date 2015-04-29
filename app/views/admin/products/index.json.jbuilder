json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :image_name, :price
  json.url product_url(product, format: :json)
end
