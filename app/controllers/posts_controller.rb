class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to posts_path
      else
        @post.errors.full_messages
      end
  end

  def new
    @post = Post.new
      unless current_user.present?
       return redirect_to posts_path, notice: "Please Login First"
    end
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      redirect_to posts_path
    else
      post.errors.full_messages
    end
  end

  def like
    unless current_user.present?
       return redirect_to posts_path, notice: "Please Login First"
    end
  post = Post.find_by(id: params[:id])
  return redirect_to posts_path, alert: "Post not found" unless post

  # Check if the current user ID is already in likeable_ids to avoid duplicates
  unless post.likeable_ids.include?(current_user.id) && post.count_check != false
    # Add current_user.id to likeable_ids
    post.likeable_ids << current_user.id
    
    # Mark `likeable_ids` as changed so Rails knows to save it
    post.likeable_ids_will_change!

    # Increment total_count by 1
    post.total_count += 1
    post.count_check = true
    # Save changes to the database
    if post.save
       post.reload
      redirect_to posts_path, notice: "Post liked!"
    else
      redirect_to posts_path, alert: "Failed to save like."
    end
  else
    if post.count_check == true && post.total_count > 0
       post.total_count -= 1
       post.count_check = false
       post.save
    end
    # If already liked, redirect with a message
    redirect_to posts_path, alert: "You have already liked this post."
  end
end


  private

  def post_params
    params.require(:post).permit(:text, :description,images: [])
  end
end
