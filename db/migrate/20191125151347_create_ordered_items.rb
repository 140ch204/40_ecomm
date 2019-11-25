class CreateOrderedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_items do |t|
      t.belongs_to :order, index: true
      t.belongs_to :item, index: true

      t.timestamps
    end
  end
end
