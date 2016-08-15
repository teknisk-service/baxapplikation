json.extract! purchase, :id, :product, :user, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)