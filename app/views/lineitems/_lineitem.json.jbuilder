json.extract! lineitem, :id, :cart_id, :product_id, :quantity, :created_at, :updated_at
json.url lineitem_url(lineitem, format: :json)