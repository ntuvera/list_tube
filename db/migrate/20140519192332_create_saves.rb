class CreateSaves < ActiveRecord::Migration
  def change
    create_table :saves do |t|
      t.references :clips
      t.references :users
      t.timestamps
    end
  end
end
