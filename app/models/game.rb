class Game < ActiveRecord::Base
  attr_accessible :duration_time, :score, :user_id, :word_count

  has_many :game_relations
  has_many :sentences, through: :game_relations
  belongs_to :user

  validates_presence_of :user_id, on: :create, message: "You must login first"
  before_save :caculate
  after_initialize :init_sentences

  attr_accessor :sentence_size

  def init_sentences
    self.sentence_size = 10
    rand_sentences = Sentence.rand_records self.sentence_size
    rand_sentences.each do |sentence|
      game_relations.build sentence_id: sentence.id
    end
  end

  def caculate
    self.word_count = 0
    self.duration_time = 0
    self.game_relations.each do |sentence|
      self.word_count += sentence.word_count.to_i
      self.duration_time += sentence.duration_time.to_i
    end
    self.score = calc_score
  end

  def calc_score
    begin
      score = self.word_count / self.duration_time
    rescue Exception => e
      score = 0
    end
    score > 100 ? 100 : score
  end
end   
