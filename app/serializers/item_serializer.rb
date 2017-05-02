class ItemSerializer < ActiveModel::Serializer
  attributes :id,
             :merchant_id,
             :name,
             :description,
             :price,

  def price
    (object.unit_price / 100.to_f).to_s
  end
end
