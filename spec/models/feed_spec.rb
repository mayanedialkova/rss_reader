require 'rails_helper'

RSpec.describe Feed, type: :model do
  it "is valid with valid attributes" do
    feed = Feed.new(name: 'example', url: 'http:/\/\example.com')
    expect(feed).to be_valid
  end

  it "is not valid without a name" do
    feed = Feed.new(name: nil, url: 'http:/\/\example.com')
    expect(feed).to_not be_valid
  end

  it "is not valid if name is too short" do
    feed = Feed.new(name: 'a', url: 'http:/\/\example.com')
    expect(feed).to_not be_valid
  end

  it "is not valid if name is too long" do
    feed = Feed.new(name: 'a' * 300, url: 'http:/\/\example.com')
    expect(feed).to_not be_valid
  end
  it "is not valid without a url" do
    feed = Feed.new(name: 'example', url: nil)
    expect(feed).to_not be_valid
  end

  it "is not valid if url is too short" do
    feed = Feed.new(name: 'example', url: 'http')
    expect(feed).to_not be_valid
  end

  it "is not valid if url is too long" do
    invalid_url = 'http' + 'a' * 300
    feed = Feed.new(name: 'example', url: invalid_url)
    expect(feed).to_not be_valid
  end

  it "is not valid if url is wrong format" do
    feed = Feed.new(name: 'example', url: 'example.com')
    expect(feed).to_not be_valid
  end
end
