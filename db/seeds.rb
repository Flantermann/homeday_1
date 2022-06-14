# seeding the databse with realtors from realtors.json

require 'json'
filepath = "lib/seeds/realtors.json"
serialized_realtors = File.read(filepath)
realtors = JSON.parse(serialized_realtors)

puts "creating realtors..."

realtors.each do |realtor|
    Realtor.create(name: realtor["name"], city: realtor["city"], lat: realtor["lat"], lng: realtor["lng"] )
end

puts "#{Realtor.count} rows were created"
