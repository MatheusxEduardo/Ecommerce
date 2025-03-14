class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.references :productable, polymorphic: true, null: false
      t.decimal :price
      t.integer :status
      t.boolean :featured

      t.timestamps
    end
  end
end
