require 'securerandom'

# Only seed when the database is empty, so this is safe to run on every deploy.
if User.none?
  # Password comes from SEED_PASSWORD; otherwise generate a strong random one
  # and print it once so it can be retrieved from the deploy logs.
  seed_password = ENV.fetch('SEED_PASSWORD') { SecureRandom.urlsafe_base64(18) }

  User.create!([
    {username: '@guest', password: seed_password},
    {username: '@camacho', password: seed_password},
    {username: '@walsh', password: seed_password}
  ])

  # build x fake characters
  30.times do
    Character.build_full_character
  end

  source = ENV.key?('SEED_PASSWORD') ? 'SEED_PASSWORD env var' : "generated value: #{seed_password}"
  puts "Seeded #{User.count} users (password from #{source}) and #{Character.count} characters"
else
  puts "Skipping seeds: #{User.count} users already exist"
end
