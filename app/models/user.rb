class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

        has_many :permissions
	       has_many :roles, through: :permissions
        #validates_associated :permissions, :role_id

        def role? (role)
		        self.roles.pluck(:name).include?(role)
		      end

end
