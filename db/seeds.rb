Player.destroy_all
Team.destroy_all

t1 = Team.create(name: Faker::Team.creature, location: Faker::Team.state),
t2 = Team.create(name: Faker::Team.creature, location: Faker::Team.state),
t3 = Team.create(name: Faker::Team.creature, location: Faker::Team.state),
t4 = Team.create(name: Faker::Team.creature, location: Faker::Team.state),
t5 = Team.create(name: Faker::Team.creature, location: Faker::Team.state),
t6 = Team.create(name: Faker::Team.creature, location: Faker::Team.state),
t7 = Team.create(name: Faker::Team.creature, location: Faker::Team.state)

teams = Team.all

10.times do
    Player.create(
        name: Faker::Name.first_name,
        age: Faker::Number.between(from: 18, to: 40),
        position: Faker::Sports::Basketball.position,
        rating: Faker::Number.between(from: 1, to: 10),
        rookie: [true, false].sample,
        team: teams.sample
    )
end
