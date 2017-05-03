class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :items
  default_scope -> { order('id ASC') }

  def total_revenue
    invoice_items.reduce(0) do |sum, ii|
      sum += (ii.item.unit_price * ii.quantity) if ii.invoice.status == "shipped"
    end
    # 56612301
  end
end
