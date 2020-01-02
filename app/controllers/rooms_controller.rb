class RoomsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create]

  def index
    @rooms = current_user.display_rooms
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new(from_id: current_user.id, to_id:@room.micropost.user)
    @messages = Message.where(room_id: @room.id)
  end

  def create
    @room = Room.new(buyer_id: current_user.id, micropost_id: params[:micropost_id])
    @micropost = Micropost.find(params[:micropost_id])
    if !@micropost.purchased && @room.save
      @micropost.purchased = true
      @micropost.save
      flash[:success] = "商品を購入しました！"
      UserMailer.notice_buying(@micropost, current_user, @micropost.user, @room).deliver_now
      UserMailer.notice_bought(@micropost, current_user, @micropost.user, @room).deliver_now
      redirect_to rooms_url
    else
      flash[:danger] = "商品を購入できませんでした"
      redirect_to root_url
    end
  end

end
