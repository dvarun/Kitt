class Video < ActiveRecord::Base

 belongs_to :batch
	has_many :users
	has_many :comments
 has_attached_file :content
 #validates_attachment_content_type :content, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif","video/avi"]
 do_not_validate_attachment_file_type :content

# include AASM
#
#  aasm do
#    state :pending, :initial => true
#    state :converting
#    state :converted, :enter => :set_new_filename
#    state :error
#
#    event :convert do
#      transitions :from => :pending, :to => :converting
#    end
#
#    event :converted do
#      transitions :from => :converting, :to => :converted
#    end
#
#    event :failed do
#      transitions :from => :converting, :to => :error
#    end
#   end
#
#   def aasm_state
#     self[:aasm_state] || "pending"
#   end
#
#    def convert
#      self.convert!
#      success = system(convert_command)
#      if success && $?.exitstatus == 0
#        self.converted!
#      else
#        self.failure!
#      end
#    end
#
#    protected
#
#    # This method creates the ffmpeg command that we'll be using
#    def convert_command
#      flv = File.join(File.dirname(content.path), "#{id}.flv")
#      File.open(flv, 'w')
#
#      command = <<-end_command
#        ffmpeg -i #{ content.path } -ar 22050 -ab 32 -acodec mp3
#      -s 480x360 -vcodec flv -r 25 -qscale 8 -f flv -y #{ flv }
#      end_command
#      command.gsub!(/\s+/, " ")
#    end
#
#    # This update the stored filename with the new flash video file
#    def set_new_filename
#      update_attribute(:content_file_name, "#{id}.flv")
#    end


end
