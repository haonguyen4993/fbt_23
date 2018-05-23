Category.create!([
  {name: "Vietnam Tour", description: Faker::Lorem.sentence},
  {name: "World Tour", description: Faker::Lorem.sentence},
  {name: "North Vietnam", description: Faker::Lorem.sentence, parent_id: 1},
  {name: "South Vietnam", description: Faker::Lorem.sentence, parent_id: 1},
  {name: "Central Vietnam", description: Faker::Lorem.sentence, parent_id: 1},
  {name: "Europe", description: Faker::Lorem.sentence, parent_id: 2},
  {name: "Asian", description: Faker::Lorem.sentence, parent_id: 2},
  {name: "Europe", description: Faker::Lorem.sentence, parent_id: 2},
  {name: "Ha Noi", description: Faker::Lorem.sentence, parent_id: 3},
  {name: "Ho Chi Minh", description: Faker::Lorem.sentence, parent_id: 4},
  {name: "Da Nang", description: Faker::Lorem.sentence, parent_id: 5},
  {name: "Italia", description: Faker::Lorem.sentence, parent_id: 6},
  {name: "France", description: Faker::Lorem.sentence, parent_id: 6},
  {name: "Korea", description: Faker::Lorem.sentence, parent_id: 7},
  {name: "Japan", description: Faker::Lorem.sentence, parent_id: 7}
])

10.times{
  Tour.create!(
    name: Faker::Lorem.word,
    rating: Faker::Number.between(1, 10),
    image: "",
    itinerary: "",
    content: Faker::Lorem.sentence,
    category_id: Faker::Number.between(1, 15)
  )
}

10.times{
  DescriptionDetail.create!(
    price: Faker::Number.decimal(2),
    start_day: Faker::Date.backward(14) ,
    end_day: Faker::Date.forward(23),
    tour_id: Faker::Number.between(1, 10)
  )
}

10.times do |n|
  User.create!(
    name: Faker::Name.name,
    email: "example-#{n+1}@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    role: 0
  )
end

10.times{
  Booking.create!(
    status: "Approved",
    price: Faker::Number.decimal(2),
    quantity: Faker::Number.between(1, 5),
    user_id: Faker::Number.between(1, 10),
    description_detail_id:Faker::Number.between(1, 10)
  )
}

3.times{
  Review.create!(
    content: Faker::Lorem.paragraph,
    user_id: Faker::Number.between(1, 10),
    tour_id: Faker::Number.between(1, 10)
  )
}

3.times{
  Comment.create!(
    content: Faker::Lorem.paragraph,
    user_id: Faker::Number.between(1, 10),
    review_id: Faker::Number.between(1, 3)
  )
}
