class RenameColumnCliptoClipId < ActiveRecord::Migration
  def change
    rename_column :clips_users, :clip, :clip_id
  end
end
