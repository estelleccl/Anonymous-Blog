class Tag < ActiveRecord::Base
  has_many :posttags
  has_many :posts, through: :posttags
  validates_uniqueness_of :tag_name
  validates :tag_name, :presence => true
end