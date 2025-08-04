class CreateInspectionItem < ActiveRecord::Migration[8.0]
  def change
    create_table :inspection_items do |t|
      t.column :name, :string, null: false
      t.column :category_id, :integer, null: false

      t.timestamps
    end

    add_index :inspection_items, :name
    add_index :inspection_items, :category_id
  end
end
