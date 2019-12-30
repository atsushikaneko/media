class CommentsController < ApplicationController

def create
  @blog = Blog.find(params[:blog_id])
  @comment = @blog.comments.build(comment_params)
  @comment.user_id = current_user.id
  if @comment.save
    render :index
  end
end

def destroy
  @comment = Comment.find(params[:id])
  if @comment.destroy
    render :index
  end
end

private
  def comment_params
    params.require(:comment).permit(:content, :blog_id, :user_id)
  end

end
