class SentenceSerializer < ActiveModel::Serializer
  attributes :id, :content, :word_count, :type_id
end
