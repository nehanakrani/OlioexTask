require 'rails_helper'

RSpec.describe ArticlesList do
  describe '#collect and parse data' do
    let(:articles_json) { ArticlesList.new.call }
    it 'should be parse json data and map with likes' do
      expect(articles_json).to be_kind_of(Array)
      expect(articles_json.first).to have_key(:id)
      expect(articles_json.first).to have_key(:title)
    end
  end
end
