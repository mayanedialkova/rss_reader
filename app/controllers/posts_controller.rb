# Renders the articles from the created feeds
class PostsController < ApplicationController
  # GET /
  # GET /posts
  # GET /posts/*params
  # GET /posts.json
  def index
    @posts = Kaminari.paginate_array(prepare_posts, limit: 20)
                     .page(params[:page])
  end

  private

  # Defines time constraint
  def published_after
    1.week.ago
  end

  # Gets the valid posts from all feeds and orders them chronologically
  def prepare_posts
    posts = []
    feed_urls = Feed.pluck(:url)

    feed_urls.each do |url|
      posts += gather_data_from_feed(url)
    end

    # Sort by date with the most recent first
    posts.sort { |post_a, post_b| post_b.published <=> post_a.published }
  end

  def gather_data_from_feed(url)
    parsed_feed = Feedjira::Feed.fetch_and_parse(url)

    # Select only the newest entries
    filtered_entries = parsed_feed.entries.select do |entry|
      entry.published >= published_after
    end

    # Create Post objects with the necessary data
    filtered_entries.map do |entry|
      Post.new(entry.title, entry.url, entry.published)
    end.reject(&:invalid?)
  rescue StandardError => e
    print e
    []
  end
end
