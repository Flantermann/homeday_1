# seeding the databse with realtors from realtors.json

require 'json'

puts "creating realtors..."

path = Rails.root.join('app', 'lib','realtors.json')
realtors = JSON.parse(File.read(path))

realtors["realtors"].each do |realtor|
    Realtor.create(realtor)
end

puts "#{Realtor.count} rows were created"
