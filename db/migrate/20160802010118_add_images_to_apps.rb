class AddImagesToApps < ActiveRecord::Migration[5.0]
  def change
    remove_column :apps, :share_image_id, :string
    add_column :apps, :share_image, :string
    add_column :apps, :logo_image, :string
  end
end
