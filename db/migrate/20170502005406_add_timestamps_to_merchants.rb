class AddTimestampsToMerchants < ActiveRecord::Migration[5.0]
  def change
    add_timestamps(:merchants)
  end
end
