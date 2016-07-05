class AddMissionAndDisclaimerToApps < ActiveRecord::Migration[5.0]
  def change
    add_column :apps, :mission, :text
    add_column :apps, :disclaimer, :text
  end
end
