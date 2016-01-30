class CreateJoinTableAuthorTitle < ActiveRecord::Migration[5.0]
  def change
    create_join_table :authors, :titles do |t|
      t.index [:author_id, :title_id]
      t.index [:title_id, :author_id]
    end
  end
end
