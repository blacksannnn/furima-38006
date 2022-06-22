class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @product = Product.find(params[:product_id])
    if @comment.save
      CommentChannel.broadcast_to @product, { comment: @comment, user: @comment.user } 

      # redirect_to product_path(params[:product_id])
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
  end


end
