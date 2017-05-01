class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.text :name
      t.integer :unit_price
      t.text :description

      t.timestamps
    end
  end
end
