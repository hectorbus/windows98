class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = current_user.comments.new(article_id: params[:article_id])
    @comment.body = comment_params[:body]
    @comment.save
    redirect_to article_path(@article)
  end

  def destroy
    @comment = Comment.find(params[:article_id])
    @comment.destroy

    redirect_to :back
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
