# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  describe 'GET /articles' do
    it 'responds with success' do
      get root_path
      expect(response).to have_http_status(200)
    end

    it 'show the article with titles and other details' do
      get root_path
      expect(response.body).to include('Waterproof jacket')
    end
  end

  describe 'POST /like' do
    it 'responds with success' do
      expect(Like.count).to eq(0)
      post '/like', params: { article_id: '1234' }
      expect(Like.count).to eq(1)
    end
  end
end
