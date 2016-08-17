Fabricator(:purchase) do
  product_id { Product.order("RANDOM()").first.id }
  user_id { User.order("RANDOM()").first.id }
end
