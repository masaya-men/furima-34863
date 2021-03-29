class CommentsController < ApplicationController

  def new
  end

  def create
    @comment = Comment.new(comment_params)
    unless @comment.comment == ""
      @comment.save
      ActionCable.server.broadcast 'comment_channel', {content: @comment, user: current_user.nickname}
    end
  end

  # デプロイ成功で消すコメントが空でも保存できた修正前のコード=============
  # def create
  #   @comment = Comment.new(comment_params)
  #   if @comment.save
  #     ActionCable.server.broadcast 'comment_channel', {content: @comment, user: current_user.nickname}
  #   end
  # end
  # デプロイ成功で消すコメントが空でも保存できた修正前のコード=============


  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
