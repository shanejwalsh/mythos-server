# create 2 'dummy' users
User.create([
  {username: '@guest', password: 'password'}, 
  {username: '@camacho', password: 'password'}, 
  {username: '@walsh', password: 'password'}
])

# uncomment below to build x fake characters
30.times do
  Character.build_full_character
end
