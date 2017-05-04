class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  has_many :invoice_items, through: :invoices


  def total_revenue
    invoices
    .joins(:invoice_items)
    .merge(InvoiceItem.successful)
    .sum('unit_price * quantity')
  end

  def revenue_on_date(date)
    invoices.where(created_at: date)
    .joins(:invoice_items)
    .merge(InvoiceItem.suffessful)
    .sum('unit_price * price')
  end
end

# all invoices for merchant merchant.invoices
# for each invoice all invoice items
# for each invoice_items get item price and quantity

#
