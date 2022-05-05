class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    if @comment.save
      redirect_to @article
    else
      redirect_to @article, notice: "Minimum commenter length: 2. Minimum comment length: 5"
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: 303
  end

  def show
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  def index
    @article = Article.find(params[:article_id])
    redirect_to article_path(@article)
  end


  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
