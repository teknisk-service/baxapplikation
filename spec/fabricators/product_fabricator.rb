require 'faker'

Fabricator(:product) do
  name { Faker::Commerce.product_name }
  price { Faker::Commerce.price }
end
