class CreateClipsUsers < ActiveRecord::Migration
  def change
    create_table :clips_users do |t|
      t.integer :user_id
      t.integer :clip
    end
  end
end
