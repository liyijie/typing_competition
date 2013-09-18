class Sentence < ActiveRecord::Base
  attr_accessible :content, :type_id, :word_count

  belongs_to :type
  has_many :game_relations
  has_many :games, through: :game_relations
end