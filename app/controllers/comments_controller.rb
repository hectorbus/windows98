class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = current_user.comments.new(article_id: params[:article_id])
    @comment.body = comment_params[:body]
    @comment.save
    puts @comment.errors.inspect
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
