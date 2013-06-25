class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.text :item

      t.timestamps
    end
  end
end
