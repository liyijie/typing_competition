class Sentence < ActiveRecord::Base
  attr_accessible :content, :type_id
  attr_readonly :word_count
  belongs_to :type
  has_many :game_relations
  has_many :games, through: :game_relations

  before_save :calc_word_count

  def calc_word_count
    str = content.to_s
    z = str.scan(/\p{Han}+/u).join #选出中文
    h = str.gsub(/\p{Han}+/u, " ") #选出将中文的位置用空格代替

    self.word_count = h.scan(/[^\p{P}|\s]+/u).length() + z.length() #选出英文单词并输出字数
  end

  def self.rand_record
    offset(rand(self.count)).first
  end

  def self.rand_records size
    rand_records = []
    size.times do
      rand_records << rand_record
    end
    rand_records
  end
end