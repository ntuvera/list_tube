class CreateFaves < ActiveRecord::Migration
  def change
    create_table :faves do |t|
      t.integer :user_id
      t.integer :clip_id

      t.timestamps
    end
  end
end
