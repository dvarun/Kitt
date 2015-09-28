class WatchedVideo < ActiveRecord::Base
  belongs_to :batch
  belongs_to :video
  belongs_to :user
end
