FactoryBot.define do
  factory :post do
    title 'ABC News'
    url 'http://abc_news.com/articles/3'
    published 1.day.ago
  end
end
