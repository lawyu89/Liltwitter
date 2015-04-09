class Follow < ActiveRecord::Base
  belongs_to :leader, class_name: "User"
  belongs_to :minion, class_name: "User"
end