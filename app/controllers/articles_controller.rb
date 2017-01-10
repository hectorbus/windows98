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

  def edit
    @article = Article.find(params[:id])

  end

  def create
    @article = current_user.articles.new(user_id: params[:user_id])
    @article.title = article_params[:title]
    @article.text = article_params[:text]

    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :publisher)
  end

end
