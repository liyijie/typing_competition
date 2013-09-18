class GameRelation < ActiveRecord::Base
  attr_accessible :game_id, :sentence_id
  belongs_to :sentence
  belongs_to :game
end
