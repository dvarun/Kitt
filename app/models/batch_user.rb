class BatchUser < ActiveRecord::Base
  belongs_to :user
	 belongs_to :batch
end
