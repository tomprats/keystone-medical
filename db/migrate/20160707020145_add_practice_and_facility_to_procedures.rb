class AddPracticeAndFacilityToProcedures < ActiveRecord::Migration[5.0]
  def change
    add_column :procedures, :practice_id, :integer, null: false, index: true
    add_column :procedures, :facility_id, :integer, null: false, index: true
    remove_column :procedures, :organization_id, :integer
  end
end
