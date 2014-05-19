class RemoveIdFromClipsUsers < ActiveRecord::Migration
  def change
    remove_column :clips_users, :id, :integer
  end
end
