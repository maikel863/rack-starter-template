Gym.destroy_all

gym_prices = [1000, 3000, 8000]

5.times do
    Gym.create(name: "#{Faker::Name.first_name}'s Gym", location: Faker::Address.city, monthly_price: gym_prices.sample)
end

puts 'Gyms Seeded'

GymMember.destroy_all

gyms = Gym.all

gym_member_focuses = ['body buidling', 'power lifting']

10.times do
    GymMember.create(name: Faker::Name.first_name, focus: gym_member_focuses.sample, gym: gyms.sample)
end

puts 'Gym Members Seeded'

puts 'Seeding complete'