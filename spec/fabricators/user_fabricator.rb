require 'faker'

Fabricator(:user) do
  name { Faker::Pokemon.name }
  email { Faker::Internet.email }
  password { Faker::Internet.password }
end
