class ItemSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :unit_price,
             :description,
             :created_at,
             :updated_at,
             :invoice_count,
             :merchant,
             :invoices

  # has_many :invoices
  # belongs_to :merchant

  def invoice_count
    object.invoices.count
  end
end
