FactoryBot.define do
  factory :tour do
    association :category
    name {Faker::Name.name}
    short_description {Faker::Lorem.sentence}
    itinerary {Faker::Lorem.sentence}
    content {Faker::Lorem.sentence}
    image  Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, "/app/assets/images/tour-1.jpg")))

    after(:build) do |tour|
      3.times {tour.description_details << FactoryBot.build(:description_detail, tour: tour)}
    end

    factory :invalid_tour do
      name nil
      short_description nil
      category_id nil
      image nil
      itinerary nil
      content nil
    end

    factory :tour_has_pending_booking do
      after(:build) do |tour|
        tour.description_details.first.bookings << FactoryBot.build(:booking, description_detail: tour.description_details.first)
      end
    end
  end
end
