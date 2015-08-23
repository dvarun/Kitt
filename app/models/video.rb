class Video < ActiveRecord::Base

 belongs_to :batch
	has_many :users
	has_many :comments

end
