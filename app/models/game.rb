class Game < ActiveRecord::Base
  attr_accessible :duration_time, :score, :user_id, :word_count
end
