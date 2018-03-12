require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, Kaminari.paginate_array([
      Post.new(
        'Article',
        'https://www.abc.net/news/123',
        2.day.ago
      ),
      Post.new(
        'Blog post',
        'https://www.some_blog.net/456',
        1.day.ago
      )
    ]).page)
  end

  it "renders a list of posts" do
    render
    assert_select '.container .row', /Article|Blog post/, count: 2
  end
end
