class Video < ActiveRecord::Base

 belongs_to :batch
	has_many :users
	has_many :comments
# before_destroy :delete_childs
 has_attached_file :content


 #validates_attachment_content_type :content, :content_type => ["video/x-flv"]
 before_save :generate_video_code
 do_not_validate_attachment_file_type :content

 private
 def generate_video_code
 		if self.video_code.nil?
 			self.video_code = "VID - #{Random.rand(100)}"
 		end
 	end


 # def delete_childs
	# 	wv = WatchedVideo.where('video_id = ?',self.id)
	# 	WatchedVideo.delete_all(wv.id)
	# end

end
