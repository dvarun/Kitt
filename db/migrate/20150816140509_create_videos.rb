class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.string :tag
      t.float :file_size
      t.string :description
      t.integer :batch_id
      t.integer :file_path
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
