class Video < ActiveRecord::Base

 belongs_to :batch
	has_many :users
	has_many :comments
 has_attached_file :content
 #validates_attachment_content_type :content, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif","video/avi"]
do_not_validate_attachment_file_type :content
end
