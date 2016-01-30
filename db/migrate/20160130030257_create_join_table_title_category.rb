class CreateJoinTableTitleCategory < ActiveRecord::Migration[5.0]
  def change
    create_join_table :categories, :titles do |t|
      t.index [:category_id, :title_id]
      t.index [:title_id, :category_id]
    end
  end
end
