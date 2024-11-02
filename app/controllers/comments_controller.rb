# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @article = Article.public.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.status = :public
    @comment.save
    redirect_to @article
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.update(status: :archived)
    redirect_to article_path(params[:article_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
