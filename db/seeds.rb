# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', '2018_CMF_Participants.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    b = Business.new
    b.name = row['employer']
    b.address1 = row['address']
    b.address2 = row['address2']
    b.state = row['state']
    b.city = row['city']
    b.zip = row['zip']
    b.website_url = row['website']
    b.phone_number = row['phone']
    b.logo = row['mphoto_path']
    b.status = 2
    b.save
    puts "#{b.name} saved"
  end

puts "There are now #{Business.count} rows in the business table"

puts "Now populating blazer queries!"
#Please be aware that this will only work locally. comment out if deployed to heroku
queries_list = [
  ["Accounts created per month","SELECT strftime('%m-%Y', created_at) AS Month, COUNT(*) AS Accounts_created FROM accounts GROUP BY 1","main"],
  ["Daily Visitors to site","SELECT strftime('%m-%d-%Y', started_at) AS date, COUNT(*) AS Visitors FROM ahoy_visits GROUP BY 1","main"],
  ["Businesses Popularity Total","SELECT BUSINESSES.name  AS Business, SUM(DEALS.popularity) AS Popularity FROM DEALS, BUSINESSES WHERE BUSINESSES.id = DEALS.business_id ORDER BY popularity ASC","main"],
  ["Deals created a month","SELECT  BUSINESSES.name, strftime('%m-%Y', DEALS.created_at) As Month, COUNT(*) AS Deals FROM DEALS, BUSINESSES WHERE DEALS.business_id = BUSINESSES.id ORDER BY BUSINESSES.name ASC","main"],
  ["Events created a month","SELECT  BUSINESSES.name, strftime('%m-%Y', EVENTS.created_at) As Month, COUNT(*) AS Events FROM EVENTS, BUSINESSES WHERE EVENTS.business_id = BUSINESSES.id ORDER BY BUSINESSES.name ASC","main"]
]

queries_list.each do |name, statement, data_source|
  BlazerQueries.create(name: name, statement: statement, data_source: data_source ) 
  puts "#{name} query created!"
end

  
