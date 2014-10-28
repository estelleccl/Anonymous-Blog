class Tag < ActiveRecord::Base
  has_many :posttags
  has_many :posts, through: :posttags
  validates :tag_name, :presence => true
end