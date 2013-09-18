class Game < ActiveRecord::Base
  attr_accessible :duration_time, :score, :user_id, :word_count

  has_many :game_relations
  has_many :sentences, through: :game_relations
  belongs_to :user

  validates_presence_of :user_id, on: :create, message: "You must login first"

  def score
    score = self.word_count * 1.0 / self.duration_time
    score > 100 ? 100 : score
  end
end   
