class Game < ActiveRecord::Base
  attr_accessible :duration_time, :score, :user_id, :word_count

  has_many :game_relations
  has_many :sentences, through: :game_relations
  belongs_to :user

  validates_presence_of :user_id, on: :create, message: "You must login first"
end
