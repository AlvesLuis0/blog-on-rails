# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.public
  end

  def show
    @article = Article.public.find(params[:id])
    @comments = Comment.where(article_id: @article.id, status: :public)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.status = :public
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.update(status: :archived)
    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
