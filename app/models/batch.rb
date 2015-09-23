class Batch < ActiveRecord::Base
    has_many :batch_users
    has_many :users, through: :batch_users

    validates_length_of :name, :minimum => 3, :maximum => 120, :allow_blank => false
    validates_length_of :description, :minimum => 3, :maximum => 120, :allow_blank => false
    validates_presence_of :start_date
end
