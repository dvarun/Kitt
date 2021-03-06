class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

        has_many :permissions
	       has_many :roles, through: :permissions
        has_many :watched_videos
        validates_length_of :firstname, :minimum => 2, :maximum => 120, :allow_blank => false
        validates_length_of :lastname, :minimum => 2, :maximum => 120, :allow_blank => false
        validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
        validates_length_of :password, :minimum => 4, :maximum => 64, :allow_blank => false
        validates_associated :roles

        def role? (role)
		        self.roles.pluck(:name).include?(role)
		      end

end
