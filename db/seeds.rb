Fabricate(:user, name: "Aron", email: "aronst@kth.se", password: 'asdfasdf')
Fabricate(:user, name: "Bob", email: "r.gileborg@gmail.com")
Fabricate(:user, name: "Hanna", email: "hnyblom@kth.se")
Fabricate(:user, name: "Helena", email: "halinder@kth.se")
Fabricate(:user, name: "Henry", email: "henrye@kth.se")
Fabricate(:user, name: "Jossan", email: "josefin.l.nilsson@gmail.com")
Fabricate(:user, name: "Pontus", email: "pontus.broberg95@gmail.com")
Fabricate(:user, name: "Shappe", email: "shapour@kth.se")
Fabricate(:user, name: "Thimmy", email: "idontevenknow@gmail.com")
Fabricate(:user, name: "Wille", email: "wak@kth.se")

Fabricate.times(10, :product)

Fabricate.times(50, :purchase)
