class ChangeAppsColumns < ActiveRecord::Migration
  def change
    change_table :apps do |t|
      t.string :wiki_path
      t.string :primary_team
    end
  end
end
