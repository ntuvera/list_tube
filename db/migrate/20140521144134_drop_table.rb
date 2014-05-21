class DropTable < ActiveRecord::Migration
  def change
    drop_table :faves
  end
end
