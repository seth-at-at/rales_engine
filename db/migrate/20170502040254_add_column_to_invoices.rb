class AddColumnToInvoices < ActiveRecord::Migration[5.0]
  def change
    add_column :invoices, :merchant_id, :integer
  end
end
