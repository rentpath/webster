class ChangeApplicationMetadataToText < ActiveRecord::Migration
  def change
    change_column :applications, :metadata,  :text
  end
end
