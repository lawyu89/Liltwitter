class User < ActiveRecord::Base
  has_many :minion_followings, foreign_key: "leader_id", class_name: "Follow"
  has_many :leader_followings, foreign_key: "minion_id", class_name: "Follow"

  has_many :minions, through: :minion_followings
  has_many :leaders, through: :leader_followings

  # has_many :minions, foreign_key: "follower_id",
  #                      class_name: "Follow"
  # has_many :user_followers, through: :minions,
  #                       source: :follower

  # has_many :leaders, foreign_key: "following_id",
  #                     class_name: "Follow"
  # has_many :user_followings, through: :leaders,
  #                       source: :following
end
