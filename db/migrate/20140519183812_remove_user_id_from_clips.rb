class RemoveUserIdFromClips < ActiveRecord::Migration
  def change
    remove_column :clips, :user_id, :integer
  end
end
