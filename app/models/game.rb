class Game < ActiveRecord::Base
  attr_accessible :duration_time, :score, :user_id, :word_count
  has_many :game_relations
  has_many :sentences, through: :game_relations
  belongs_to :user
end
