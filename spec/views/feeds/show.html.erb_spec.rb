require 'rails_helper'

RSpec.describe "feeds/show", type: :view do
  before(:each) do
    @feed = assign(:feed, Feed.create!(
      name: 'ABC News',
      url: 'https://www.abc.net/news/'
    ))
  end

  it "renders attributes" do
    render
    expect(rendered).to match(/ABC News/)
    expect(rendered).to match(/https:\/\/www.abc.net\/news\//)
  end
end
