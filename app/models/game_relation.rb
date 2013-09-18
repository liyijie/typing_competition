class GameRelation < ActiveRecord::Base
  attr_accessible :game_id, :sentence_id, :duration_time, :word_count
  belongs_to :sentence
  belongs_to :game

end
