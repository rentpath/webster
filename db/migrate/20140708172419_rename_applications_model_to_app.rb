class RenameApplicationsModelToApp < ActiveRecord::Migration
  def change
      rename_table :applications, :apps
  end
end
