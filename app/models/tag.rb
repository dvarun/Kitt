class Tag < ActiveRecord::Base
    
    belongs_to :video
	belongs_to :batch
    
end
