class Share < ActiveRecord::Base
  belongs_to :users
  belongs_to :receiver, :class_name => "User"
  has_many :shares

end
