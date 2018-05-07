
Account.delete_all
Personnel.delete_all
10.times do |n|
    email = Faker::Internet.email
    username = Faker::GameOfThrones.character

    Personnel.create!(
        username: username,
        rank: rand(0...23),
        branch: rand(0...4),
        
    )
    Account.create!(
        :email => email, 
        :password => 'changeme', 
        :password_confirmation => 'changeme',
        :accountable =>  Personnel.find_by_username(username)
    )
end