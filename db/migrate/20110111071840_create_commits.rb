class CreateCommits < ActiveRecord::Migration
  def self.up
    create_table :commits do |t|
    t.string :sha
    t.integer :author_id
    t.integer :repository_id
    t.string :comment

    t.timestamps
    end
  end

  def self.down
    drop_table :commits
  end
end
