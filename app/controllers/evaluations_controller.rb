class EvaluationsController < ApplicationController
  def index
    @evaluations = Evaluation.where(to_id: params[:user_id])
  end

  def new
    @evaluation = Evaluation.new(from_id: current_user.id, to_id: params[:to_id], micropost_id: params[:micropost_id])
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      room = Room.find_by(micropost_id: @evaluation.micropost.id)
      if Evaluation.where(micropost_id: @evaluation.micropost.id).count == 2
        room.used = true
        room.save
        from = User.find(@evaluation.from_id)
        to = User.find(@evaluation.to_id)
        UserMailer.evaluating_done(room.micropost, from, to, room).deliver_now
        UserMailer.evaluating_done(room.micropost, to, from, room).deliver_now
      else
        if current_user.id == @evaluation.from_id
          to = User.find(@evaluation.to_id)
          UserMailer.evaluating(room.micropost, to, current_user, room).deliver_now
          UserMailer.evaluated(room.micropost, current_user, to, room).deliver_now
        elsif current_user.id == @evaluation.to_id
          from = User.find(@evaluation.from_id)
          UserMailer.evaluating(room.micropost, from, current_user, room).deliver_now
          UserMailer.evaluated(room.micropost, current_user, from, room).deliver_now
        end
      end
      flash[:success] = "評価をしました！"
      redirect_to rooms_url
    else
      flash[:danger] = "入力に不備があります。"
      render 'new'
    end
  end

  private

    def evaluation_params
      params.require(:evaluation).permit(:from_id, :to_id, :micropost_id, :value, :comment)
    end
end
