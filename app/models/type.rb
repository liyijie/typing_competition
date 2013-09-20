class Type < ActiveRecord::Base
  attr_accessible :lang
  validates_uniqueness_of :lang
  has_many :sentences

  def to_s
    lang
  end
end
