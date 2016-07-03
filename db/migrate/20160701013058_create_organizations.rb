class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string  :name,     null: false
      t.string  :website,  null: false
      t.string  :logo
      t.string  :description

      t.timestamps         null: false
    end
  end
end
