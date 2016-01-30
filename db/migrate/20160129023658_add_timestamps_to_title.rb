class AddTimestampsToTitle < ActiveRecord::Migration[5.0]
  def change
    change_table :title do |t|
      t.timestamps
    end
  end
end
