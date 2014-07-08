class CreateHooks < ActiveRecord::Migration
  def change
    create_table :hooks do |t|
      t.string :name
      t.text :payload

      t.timestamps
    end
  end
end
