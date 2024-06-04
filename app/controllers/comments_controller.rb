class CommentsController < ApplicationController
  before_action :set_post, only: [:new, :create, :destroy]
  before_action :set_comment, only: [:show, :update, :destroy]
  
  def index
   @comments = Comment.all 
  end

  def show
  end

  def new
    @comment = @post.comments.new(parent_id: params[:parent_id])
  end

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to @post
    else
      render :new
    end
  end

  def destroy
    @comment = @post.comments.find params[:id]
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id, :parent_id)
  end
end
    
  

 



  

  
