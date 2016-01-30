class CreateEditions < ActiveRecord::Migration[5.0]
  def change
    create_table :editions do |t|
      t.integer :year
      t.string :city
      t.integer :publisher_id
      t.integer :title_id
      t.string :isbn, index: true

      t.timestamps
    end

    add_foreign_key :editions, :titles
  end
end
