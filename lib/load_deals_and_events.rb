Business.delete_all
website_url = Faker::Internet.url
Business.create(
  name: "Test Business",
  phone_number: "123-456-7890",
  address1: "Test Drive",
  address2: "PO Box #1101",
  state: "GA",
  city: "Valdosta",
  zip: "12345",
  website_url: website_url,
  status: 2,
  description: "Lorem Ipsum"
)
email = Faker::Internet.email
Account.create!(
  :email => email, 
  :password => 'changeme', 
  :password_confirmation => 'changeme',
  :accountable =>  Business.find_by_name("Test Business")
)

Deal.delete_all
99.times do |n|
  name = Faker::Lorem.sentence
  description = Faker::Lorem.paragraph

  Deal.create!(  
    name: name,
    description: description,
    start_date: Date.tomorrow,
    end_date: Date.tomorrow + 1 + rand(1000),
    popularity: rand(1000),
    category: rand(8),
    business_id: Business.find_by_name("Test Business").id
  )
end

Event.delete_all
99.times do |n|
  name = Faker::Lorem.sentence
  description = Faker::Lorem.paragraph
  location = Faker::Address.community
  address1 = Faker::Address.street_address
  address2 = Faker::Address.secondary_address
  website_url = Faker::Internet.url

  Event.create!(  
    name: name,
    description: description,
    start: Time.zone.now,
    end: Time.zone.now + 3.days,
    location: location,
    address1: address1,
    address2: address2,
    city: "Valdosta",
    state: "GA", 
    zip: "31602",
    website_url: website_url,
    business_id: Business.find_by_name("Test Business").id
  )
end
