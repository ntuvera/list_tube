class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.references :users_id
      t.references :receiver_id
      t.references :clip_id
      t.timestamps
    end
  end
end
