class RemoveRepoIdFromHooks < ActiveRecord::Migration
  def up
    remove_column :hooks, :repo_id
  end

  def down
    add_column :hooks, :repo_id, :string
  end
end
