class Type < ActiveRecord::Base
  attr_accessible :lang

  has_many :sentences

  def to_s
    lang
  end
end
