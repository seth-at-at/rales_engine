class Item < ApplicationRecord
  belongs_to :merchant
  has_many   :invoice_items
  has_many   :invoices, through: :invoice_items

  def self.most_revenue(quantity)
    joins(:invoices)
    .merge(Invoice.successful)
    .group(:id)
    .order("sum(invoice_items.quantity * invoice_items.unit_price) DESC")
    .first(quantity)
  end

  def self.most_items(quantity)
    joins(:invoices)
    .merge(Invoice.successful)
    .group(:id)
    .order("sum(quantity) DESC")
    .first(quantity)
  end

  def best_day
    result = invoices
    .successful
    .group(:id)
    .order("sum(quantity * unit_price) DESC")
    .first.created_at
    {"best_day"=>"#{result}"}
  end
end
