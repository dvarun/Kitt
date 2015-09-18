class Comment < ActiveRecord::Base

 belongs_to :user
 belongs_to :video
 validates_length_of :description, :minimum => 4, :maximum => 160, :allow_blank => false

end
