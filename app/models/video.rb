class Video < ActiveRecord::Base

 belongs_to :batch
	has_many :users
	has_many :comments
 before_destroy :delete_childs
 has_attached_file :content


 #validates_attachment_content_type :content, :content_type => ["video/x-flv"]
 do_not_validate_attachment_file_type :content

 private
 def delete_childs
		wv = WatchedVideo.where('video_id = ?',self.id)
		WatchedVideo.delete_all(wv.ids)
	end

end
