user = User.create(username: "example1", password: "example1")

being = Being.new
being.name = "Alekto"
being.age = "1000"
being.species = "Erinyes"
being.parts = [
  Part.create(model: 2, color: 90, brightness: 100), 
  Part.create(model: 3, color: 75, brightness: 80), 
  Part.create(model: 3, color: 60, brightness: 90)
]

being.save
user.beings << being
