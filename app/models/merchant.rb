class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  has_many :invoice_items, through: :invoices

  def self.top_merchants(quantity = 1)
    joins(:invoice_items)
    .merge(Invoice.successful)
    .group("merchants.id")
    .order("sum(unit_price * quantity) DESC")
    .first(quantity)
  end

  def self.most_items(quantity = 1)
    joins(:invoice_items)
    .merge(Invoice.successful)
    .group("merchants.id")
    .order("sum(quantity) DESC")
    .first(quantity)
  end

  def self.revenue_by_date(date)
    joins(:invoice_items)
    .merge(InvoiceItem.successful)
    .where("invoices.created_at = '#{date}'")
    .sum("unit_price * quantity")
  end

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
    invoices.unsuccesful
    .group(:customer)
    .order('count_all DESC')
    .count
    .keys
  end
end
