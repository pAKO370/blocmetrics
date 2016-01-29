include Faker

user_1 = User.create!(
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASS'] )


10.times do 
  Application.create!(
    user: user_1,
    name: Faker::Lorem.sentence,
    url: Faker::Internet.url
    )
end
applications = Application.all

 20.times do
  Event.create!(
    application: applications.sample,
    name: Faker::Lorem.sentence)
end
  

  puts "Seeds Finished"
  puts "#{User.count} users created"
  puts "#{Application.count} applications created"
  puts "#{Event.count} events created"


