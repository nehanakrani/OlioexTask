class ArticlesList < ApplicationService
  ARTICLES_DATA_URL = 'https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v4.json'.freeze

  def initialize
    super
    begin
      @articles_data = HTTParty.get(ARTICLES_DATA_URL).body
    rescue HTTParty::Error
      @articles_data = []
    end
  end

  def call
    JSON.parse(@articles_data, symbolize_names: true).map! do |article|
      article[:reactions][:likes] += article_likes(article[:id])
      article
    end
  end

  private

  def article_likes(id)
    Like.where(article_id: id).count
  end
end
