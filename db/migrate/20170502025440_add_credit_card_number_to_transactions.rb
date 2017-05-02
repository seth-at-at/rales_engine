class AddCreditCardNumberToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :credit_card_number, :integer, limit: 8
  end
end
