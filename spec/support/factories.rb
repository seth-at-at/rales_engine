FactoryGirl.define do
  factory :item do
    name "Banana"
    unit_price 4321
    description "Provides potassium"
  end

  factory :merchant do
    name "Billy"
  end

  factory :customer do
    first_name "BillyBob"
    last_name  "Joe"
  end

  factory :invoice do
    customer_id 1
    merchant_id 1
    status      "shipped"
  end

  factory :invoice_item do
    item_id    1
    invoice_id 1
    quantity    1
    unit_price 100
  end

  factory :transaction do
    invoice_id 1
    credit_card_number 4654405418249632
    credit_card_expiration_date nil
    result "success"
  end
end
