class ItemSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :unit_price,
             :description,
             :merchant,
             :invoice_count,
             :created_at,
             :updated_at,
             :dollar_price

  def invoice_count
    object.invoices.count
  end
end
