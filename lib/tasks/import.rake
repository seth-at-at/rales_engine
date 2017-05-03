require 'csv'

namespace :db do

  desc "Import data categories from CSV"
  task import: :environment do
    customers
    merchants
    items
    invoices
    invoice_items
    transactions
  end

private

def customers
  filename = File.join Rails.root, "/lib/assets/fixtures/customers.csv"
  CSV.foreach(filename, headers: true) do |row|
    Customer.create(first_name: row["first_name"],
                    last_name:  row["last_name"],
                    created_at: row["created_at"],
                    updated_at: row["updated_at"])
  end
end

def invoice_items
  filename = File.join Rails.root, "/lib/assets/fixtures/invoice_items.csv"
  CSV.foreach(filename, headers: true) do |row|
    InvoiceItem.create!(item_id:    row["item_id"].to_i,
                        invoice_id: row["invoice_id"].to_i,
                        quantity:   row["quantity"].to_i,
                        unit_price: row["unit_price"],
                        created_at: row["created_at"],
                        updated_at: row["updated_at"])
  end
end

def invoices
  filename = File.join Rails.root, "/lib/assets/fixtures/invoices.csv"
  CSV.foreach(filename, headers: true) do |row|
    Invoice.create(customer_id: row["customer_id"].to_i,
                   merchant_id: row["merchant_id"].to_i,
                   status:      row["status"],
                   created_at:  row["created_at"],
                   updated_at:  row["updated_at"])
  end
end

def items
  filename = File.join Rails.root, "/lib/assets/fixtures/items.csv"
  CSV.foreach(filename, headers: true) do |row|
    Item.create(name:        row["name"],
                description: row["description"],
                unit_price:  row["unit_price"].to_i/100.0,
                merchant_id: row["merchant_id"].to_i,
                created_at:  row["created_at"],
                updated_at:  row["updated_at"])
  end
end

def merchants
  filename = File.join Rails.root, "/lib/assets/fixtures/merchants.csv"
  CSV.foreach(filename, headers: true) do |row|
    Merchant.create(name:       row["name"],
                    created_at: row["created_at"],
                    updated_at: row["updated_at"])
  end
end

def transactions
  filename = File.join Rails.root, "/lib/assets/fixtures/transactions.csv"
  CSV.foreach(filename, headers: true) do |row|
    Transaction.create(invoice_id:         row["invoice_id"].to_i,
                       credit_card_number: row["credit_card_number"],
                       result:             row["result"],
                       created_at:         row["created_at"],
                       updated_at:         row["updated_at"])
  end
end
end
