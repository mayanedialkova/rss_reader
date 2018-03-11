require 'rails_helper'

RSpec.describe "feeds/index", type: :view do
  before(:each) do
    assign(:feeds, Kaminari.paginate_array([
      Feed.create!(
        name: 'ABC News',
        url: 'https://www.abc.net/news/'
      ),
      Feed.create!(
        name: 'News Blog',
        url: 'https://www.some_blog.net/news/'
      )
    ]).page(1))
  end

  it "renders a list of feeds" do
    render
    assert_select "#feeds_container .row", /News/i, :count => 2
    assert_select "#feeds_container .row", /https/i, :count => 2
  end
end
