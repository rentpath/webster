class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :name
      t.string :organization
      t.string :full_name
      t.boolean :public, default: false

      t.timestamps
    end
  end
end
