class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        @posts = Post.all.order(created_at: :desc)
        format.js
      else
        format.js {render "new"}
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        @posts = Post.all.order(created_at: :desc)
        format.js
      else
        format.js {render "edit"}
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @posts = Post.all.order(created_at: :desc)
    respond_to do |format|
      format.js
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
