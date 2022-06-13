class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post.update_posts_counter
  end

  def show
    @user = User.where(id: params[:user_id])[0]
    @post = @user.posts.where(id: params[:id])[0]
    @posts = Post.where(author_id: params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post created succesfully'
        format.html { redirect_to @post }
      else
        flash[:notice] = 'Failed creation a post. Try again'
        format.html { render :new }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:author_id, :title, :text, :comments_counter, :likes_counter)
  end
end
