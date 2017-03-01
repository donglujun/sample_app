class CommentsController < ApplicationController

  def create
    @message = Message.find(params[:message_id])
    @comment = @message.comments.new(comments_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to message_path(@message)
  end

  def comments_params
    params.require(:comment).permit(:info, :infostatus, :message_id, :user_id)
  end
    
end