class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
    
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # @article = Article.new(params[:article]) n pode pq é inseguro
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
    # redirect_to @article
    # render plain: params[:article].inspect
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
