class Game < ActiveRecord::Base
  attr_accessible :duration_time, :score, :user_id, :word_count

  has_many :game_relations
  has_many :sentences, through: :game_relations
  belongs_to :user

  validates_presence_of :user_id, on: :create, message: "You must login first"
  before_save :caculate

  def caculate 
    self.word_count = 0
    self.sentences.each do |sentence|
      self.word_count += sentence.word_count
    end
    self.score = calc_score
  end

  def calc_score
    score = self.word_count / self.duration_time
    score > 100 ? 100 : score
  end
end   
