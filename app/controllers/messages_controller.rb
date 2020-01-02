class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    unless @message.save
      flash[:danger] = "送信できませんでした"
    end
    @from = User.find(params[:message][:from_id])
    @to = User.find(params[:message][:to_id])
    UserMailer.notice_message(@message.room.micropost, @from, @to, @message.room).deliver_now
    redirect_to room_path(@message.room.id)
  end

  private

    def message_params
      params.require(:message).permit(:room_id, :from_id, :to_id, :content)
    end
end
