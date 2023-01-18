require 'rails_helper'

RSpec.describe ArticlesList do

  let(:articles_data_url) { 'https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v4.json' }
  let(:body) { JSON.parse(File.read('spec/articles_response.json').to_json) }
  let(:response) { instance_double(HTTParty::Response, body: body) }
  let(:parsed_response) { JSON.parse(body, symbolize_names: true) }

  before do
    allow(HTTParty).to receive(:get).with(articles_data_url).and_return response
  end

  it 'returns an array of articals' do
    expect(ArticlesList.call).to eq parsed_response
  end

  describe "#articals data property" do
    subject { ArticlesList.call.first }

    it 'artical has an ID' do
      expect(subject[:id]).to eq 3899631
    end

    it 'artical has a title' do
      expect(subject[:title]).to eq 'Ambipur air freshener plugin'
    end

    it 'artical has a description' do
      expect(subject[:description]).to eq 'Device only but refills are available most places'
    end

    it 'artical has a like' do
      expect(subject[:reactions][:likes]).to eq 0
    end
  end

  describe '#article likes' do
    let(:first_article) { ArticlesList.call.first }
    let(:add_like) { Like.create(article_id: 3899631) }

    it 'change like count when new like added' do
      expect do
        add_like
        ArticlesList.call
      .to change { first_article[:reactions][:likes] }.by(1)
      end
    end
  end
end
