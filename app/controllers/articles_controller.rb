class ArticlesController < ApplicationController
  def new
    @article = Article.new #crea un articulo vacio
    @article.title = 'Demo'
  end

  def create
    @article = Article.create(title: params[:article][:title])
    render json: @article
  end
end
