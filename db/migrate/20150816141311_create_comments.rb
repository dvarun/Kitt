class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :video_id
      t.integer :user_id
      t.string :Comments_tittle
      t.string :comments_body

      t.timestamps null: false
    end
  end
end
