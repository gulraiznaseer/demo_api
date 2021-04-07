class CommentsController < ApplicationController
  before_action :process_token

  before_action :set_blog
  before_action :set_comment, only: %i[show edit update destroy]
  before_action :set_user, only: %i[create new edit update destroy]
  before_action :owns_comment?, only: %i[edit update destroy]

  def index
    @comments = @blog.comments
  end

  def show; end

  def new
    @comment = @blog.comments.new
  end

  def edit; end

  def create
    @comment = @blog.comments.new(comment_params.merge(user_id: @user.id))
    @comment.save

    redirect_to blog_path(@blog)
  end

  def update
    @comment.update(comment_params)
    redirect_to blog_path(@blog)
  end

  def destroy
    @comment.destroy
    redirect_to blog_path(@blog)
  end

  private

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_user
    @user = User.find(@user_id)
  end

  def owns_comment?
    return if @user_id == @comment.user_id

    head :unauthorized
  end
end
