class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_revenue(quantity)
    joins(:invoices)
    .merge(Invoice.successful)
    .group(:id)
    .order("sum(invoice_items.quantity * invoice_items.unit_price) DESC")
    .first(quantity)
  end
end
