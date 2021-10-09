class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])

    render :new
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to home_path, notice: "The post has been successfully updated"
    else
      render :new
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to home_path, notice: "The post has been successfully created"
    else
      render :new
    end
  end

  def destroy
    Post.find(params[:id]).destroy!

    redirect_to home_path, notice: "The post has been successfully removed"
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
