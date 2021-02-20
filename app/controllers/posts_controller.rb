class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_post, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = policy_scope(Post.all)
    @tweets = policy_scope(Tweet.all)
    @politicians = Politician.all
  end

  def new
    @posts = Post.new
    authorize @posts
  end

  def create
    @post = Posts.new(post_params)
    @post.user = current_user
    authorize @post
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    authorize @post
  end

  def update
    @post.update(post_params)
    authorize @post
  end

  def destroy
    @post.destroy
    authorize @post
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:tag, :policy_area, :tweet_id, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end