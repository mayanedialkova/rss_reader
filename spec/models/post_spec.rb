require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid with valid attributes" do
    post = Post.new('Name',
                    'http:/\/\example.com',
                    1.day.ago)
    expect(post).to be_valid
  end

  it "is not valid without a title" do
    post = Post.new(nil,
                    'http:/\/\example.com',
                    1.day.ago)
    expect(post).not_to be_valid
  end

  it "is not valid without a url" do
    post = Post.new('Name',
                    nil,
                    1.day.ago)
    expect(post).not_to be_valid
  end

  it "is not valid without a published" do
    post = Post.new('Name',
                    'http:/\/\example.com',
                    nil)
    expect(post).not_to be_valid
  end
end
