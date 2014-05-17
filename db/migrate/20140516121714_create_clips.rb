class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.string :title
      t.string :url
      t.string :thumburl
      t.integer :video_id
      t.timestamps
    end
  end
end
