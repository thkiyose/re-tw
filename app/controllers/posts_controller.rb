class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html
      format.js
    end
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
