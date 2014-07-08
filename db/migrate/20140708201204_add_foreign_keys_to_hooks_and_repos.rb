class AddForeignKeysToHooksAndRepos < ActiveRecord::Migration
  def change
    change_table :hooks do |t|
      t.belongs_to :repo
    end

    change_table :repos do |t|
      t.belongs_to :app
    end
  end
end
