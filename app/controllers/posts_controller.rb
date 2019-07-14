class PostsController < ApplicationController
before_action :set_post, only: [ :show, :edit, :update, :destroy]

def index
    @posts = Post.all .order(created_at: :desc)
    @new_posts = Post.all.order(created_at: :desc).limit(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new (post_params)
    if @post.save
    redirect_to @post, notice: "ブログを登録しました。" 
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
