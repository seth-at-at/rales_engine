FactoryGirl.define do

  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Hipster.sentence(3) }
    unit_price { Faker::Number.between(1, 50000)}
    created_at "2017-05-02 17:35:14 UTC"
    merchant
  end

  factory :merchant do
    name { Faker::HarryPotter.character }
  end

  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end

  factory :invoice do
    customer
    merchant
    status      "shipped"
  end

  factory :invoice_item do
    item
    invoice
    quantity { Faker::Number.between(1, 20) }
    unit_price { Faker::Number.between(1, 50000) }
  end

  factory :transaction do
    invoice
    credit_card_number 4654405418249632
    credit_card_expiration_date nil
    result "success"
  end
end
