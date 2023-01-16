class ArticlesController < ApplicationController
  def index
    @articles = ArticlesList.call
  end

  def like
    @like = Like.create(article_id: params[:article_id])
    redirect_to root_path if @like.save
  end
end
