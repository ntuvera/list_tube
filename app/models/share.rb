class Share < ActiveRecord::Base
  belongs_to :users
  belongs_to :receivers, :class_name => "User"
  has_many :clips

end
