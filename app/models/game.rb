class Game < ActiveRecord::Base
  attr_accessible :duration_time, :score, :user_id, :word_count

  validates_presence_of :user_id, on: :create, message: "You must login first"
end
