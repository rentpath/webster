class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.text :description
      t.text :host_group
      t.binary :metadata

      t.timestamps
    end
  end
end
