class User < ActiveRecord::Base
  has_many :minion_followings, foreign_key: "leader_id", class_name: "Follow"
  has_many :minions, through: :minion_followings


  has_many :leader_followings, foreign_key: "minion_id", class_name: "Follow"
  has_many :leaders, through: :leader_followings

  has_many :tweets
end
