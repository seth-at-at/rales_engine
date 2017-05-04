class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    invoices.successful
    .group(:merchant)
    .order('count_all DESC')
    .count
    .keys
    .first
  end
end
