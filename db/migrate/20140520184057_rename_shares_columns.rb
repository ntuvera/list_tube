class RenameSharesColumns < ActiveRecord::Migration
  def change
    rename_column :shares, :clip_id_id, :clip_id
    rename_column :shares, :users_id_id, :user_id
    rename_column :shares, :receiver_id_id, :receiver_id
  end
end
