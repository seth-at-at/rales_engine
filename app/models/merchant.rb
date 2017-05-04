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
    .merge(InvoiceItem.successful)
    .sum('unit_price * quantity')
  end

  def params_check(date=nil)
    if date
      revenue_on_date(date)
    else
      total_revenue
    end
  end

  def favorite_customer
    invoices.successful
    .group(:customer)
    .order('count_all DESC')
    .count
    .keys
    .first
  end

  def customers_with_pending_invoices
    invoices.failed.group(:customer).count
  end
end
