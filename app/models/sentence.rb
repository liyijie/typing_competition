class Sentence < ActiveRecord::Base
  attr_accessible :content, :type_id, :word_count

  belongs_to :type
end