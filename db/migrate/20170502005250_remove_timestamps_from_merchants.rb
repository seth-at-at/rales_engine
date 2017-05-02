class RemoveTimestampsFromMerchants < ActiveRecord::Migration[5.0]
  def change
    remove_column :merchants, :timestamps, :string
  end
end
