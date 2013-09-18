class GameSerializer < ActiveModel::Serializer
  attributes :id, :score, :user_id, :duration_time, :word_count
end
