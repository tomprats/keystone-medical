class AddKindToOrganization < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :kind, :string, null: false
  end
end
