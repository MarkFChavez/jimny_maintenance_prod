class CreateCategory < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.column :name, :string, null: false
      t.timestamps
    end

    add_index :categories, :name, unique: true
  end
end
