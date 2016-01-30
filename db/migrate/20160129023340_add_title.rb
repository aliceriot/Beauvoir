class AddTitle < ActiveRecord::Migration[5.0]
  def change
    create_table :title do |t|
      t.string :name, null: false, index: true
    end
  end
end
