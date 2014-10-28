class Post < ActiveRecord::Base
  has_many :posttags
  has_many :tags, through: :posttags
  validates :content, :presence => true
  validates :title, :presence => true
end