class RemoveCreditCardNumberFromTransactions < ActiveRecord::Migration[5.0]
  def change
    remove_column :transactions, :credit_card_number, :integer
  end
end
