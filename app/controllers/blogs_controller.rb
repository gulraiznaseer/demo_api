class BlogsController < ApplicationController
  before_action :process_token, except: :index

  before_action :set_user, only: %i[create new edit update destroy]
  before_action :set_blog, only: %i[show edit update destroy]
  before_action :owns_blog?, only: %i[edit update destroy]

  def index
    @blogs = Blog.all
  end

  def show
    @blog
  end

  def new
    @blog = @user.blogs.new
  end

  def create
    @blog = @user.blogs.new(blog_params)
    @blog.save

    redirect_to blog_path(@blog)
  end

  def edit;  end

  def update
    @blog.update(blog_params)

    redirect_to blog_path(@blog)
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body)
  end

  def set_user
    @user = User.find(@user_id)
  end

  def owns_blog?
    return if @user_id == @blog.user_id

    head :unauthorized
  end
end
