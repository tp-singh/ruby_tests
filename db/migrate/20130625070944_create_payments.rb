class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.text :data
      t.references :line_item
      t.references :service

      t.timestamps
    end
    add_index :payments, :line_item_id
    add_index :payments, :service_id
  end
end
