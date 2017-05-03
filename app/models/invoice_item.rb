class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice
  default_scope -> { order('id ASC') }
end
