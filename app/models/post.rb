class Post
  include ActiveModel::Validations

  attr_accessor :title, :url, :published
  validates_presence_of :title, :url, :published

  def initialize(title, url, published)
    @title = title
    @url = url
    @published = published
  end
end
