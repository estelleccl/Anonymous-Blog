class Post < ActiveRecord::Base
  has_many :tags, through: :post_tag
  has_many :post_tag
  validates :content, :presence => true
  validates :title, :presence => true
end