class CreateInspectionCheck < ActiveRecord::Migration[8.0]
  def change
    create_table :inspection_checks do |t|
      t.column :inspection_item_id, :integer, null: false
      t.column :mileage_in_km, :integer, null: false
      t.column :todo, :integer, default: 0, null: false
      t.column :interval_style, :integer, default: 0, null: false
      t.column :notes, :text
      t.column :condition, :integer, default: 0, null: false

      t.timestamps
    end

    add_index :inspection_checks, :inspection_item_id
  end
end
