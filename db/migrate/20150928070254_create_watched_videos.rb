class CreateWatchedVideos < ActiveRecord::Migration
  def change
    create_table :watched_videos do |t|
     t.integer :user_id
     t.integer :video_id
     t.integer :batch_id
      t.timestamps null: false
    end
  end
end
