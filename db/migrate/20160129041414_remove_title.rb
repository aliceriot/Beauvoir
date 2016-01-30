class RemoveTitle < ActiveRecord::Migration[5.0]
  def change
    drop_table :title
  end
end
