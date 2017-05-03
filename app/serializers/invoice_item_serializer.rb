class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id,
             :item_id,
             :invoice_id,
             :price,
             :quantity

  def price
    (object.unit_price / 100.to_f).to_s
  end
end
