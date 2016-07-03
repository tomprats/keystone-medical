class CreateProcedures < ActiveRecord::Migration[5.0]
  def change
    create_table :procedures do |t|
      t.integer :organization_id,        null: false, index: true
      t.boolean :active, default: false, null: false, index: true
      t.integer :rank,   default: 100,   null: false, index: true
      t.string  :name,                   null: false
      t.string  :codes,  default: [],    null: false, array: true
      t.integer :price,                  null: false

      t.timestamps                null: false
    end
  end
end
