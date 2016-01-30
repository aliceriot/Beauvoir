class CreatePublishers < ActiveRecord::Migration[5.0]
  def change
    create_table :publishers do |t|
      t.string :name, index: true, null: false
      t.string :city

      t.timestamps
    end
  end
end
