class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.string :title
      t.string :url
      t.string :thumburl
      t.references :user
      t.timestamps
    end
  end
end
