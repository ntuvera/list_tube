class Share < ActiveRecord::Base
  belongs_to :user
  belongs_to :receivers, :class_name => "User"


end
